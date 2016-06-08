class DownloadController < ApplicationController
  def download_single
  url = (Parchment.find_by_id(params[:parchment_id])).file.url
  data = open(url)
  file_name = Parchment.find_by_id(params[:parchment_id])[:file]
  send_data data.read, filename: file_name
end

end

