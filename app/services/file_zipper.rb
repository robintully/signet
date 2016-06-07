require 'zip/zip'
require 'zip/zipfilesystem'
require 'open-uri'
class FileZipper
  @queue = :filezip_queue

  def self.perform(envelope_id, id_of_user_to_be_notified)
    user_mail = User.where(:id => id_of_user_to_be_notified).pluck(:email)
    export = FileZipper.generate_zip(envelope_id, id_of_user_to_be_notified)

    Notifications.zip_ready(export.archive_url, user_mail).deliver
  end

  def self.generate_zip(envelope_id, id_of_user_to_be_notified)
    object = Envelope.find(envelope_id)
    parchments = object.parchments
    # base temp dir
    temp_dir = Dir.mktmpdir
    # path for zip we are about to create, I find that ruby zip needs to write to a real file
    # This assumes the ObjectWithImages object has an attribute title which is a string.
    zip_path = File.join(temp_dir, "#{object.slug}_#{Date.today.to_s}.zip")

    Zip::ZipOutputStream.open(zip_path) do |zos|
      parchments.each do |parchment|
        path = parchment.s3_url
        zos.put_next_entry(path)
        zos.write parchment.parchment.file.read
      end
    end

    #Find the user that made the request
    user = User.find(id_of_user_to_be_notified)

    #Create an export object associated to the user
    export = user.exports.build

    #Associate the created zip to the export
    export.archive = File.open(zip_path)

    #Upload the archive
    export.save!

    #return the export object
    export
  ensure

    # clean up the tempdir now!
    FileUtils.rm_rf temp_dir if temp_dir
  end


end
