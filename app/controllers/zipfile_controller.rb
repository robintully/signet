class ZipfileController < ApplicationController
  def download
    zipped_file = FileZipper.perform(params[:envelope_id])
    send_file zipped_file.archive_file, disposition: 'attachment'
  end


end