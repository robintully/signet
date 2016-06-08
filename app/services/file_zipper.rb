require 'zip'
class FileZipper

  def self.perform(envelope_id)
    export = FileZipper.generate_zip(envelope_id)
  end

  def self.generate_zip(envelope_id)
    envelope = Envelope.find(envelope_id)
    parchments = envelope.parchments
    temp_dir = Dir.mktmpdir
    zip_path = File.join(temp_dir, "#{envelope.slug}_#{Date.today.to_s}.zip")

    Zip::OutputStream.open(zip_path) do |zos|
      parchments.each do |parchment|
        path = parchment.file.url
        path = path.split('/').last
        zos.put_next_entry(path)
        zos.write parchment.file.file.read
      end
    end

    export = envelope.archives.build
    file = File.open(zip_path)
    export.save
    export.archive_file = file
    export
  end

  # private

  # def set_user(user_id)
    # User.where(id: user_id)
  # end


end