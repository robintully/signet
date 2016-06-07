class SearchController < ApplicationController
  def create
    @envelope = Envelope.find_by_slug(params[:slug])
    redirect_to "/" + @envelope.slug
  end
end