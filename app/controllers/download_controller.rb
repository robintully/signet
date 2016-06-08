class DownloadController < ApplicationController
    def download_single
    zipped_file = FileZipper.perform(params[:parchment_id])
    send_file zipped_file.archive_file, disposition: 'attachment'
  end

end

