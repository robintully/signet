class SearchController < ApplicationController
  def create
    @envelope = Envelope.find_by_slug(params[:slug])
    if @envelope
      redirect_to "/" + @envelope.slug
    else
      redirect_to root_path, flash: {error: 'That is not a valid envelope'}
    end
  end
end