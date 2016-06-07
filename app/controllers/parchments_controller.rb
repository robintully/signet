class ParchmentsController < ApplicationController
  before_action :find_envelope, only: :create

  def create
    params[:attachment][:file].each do |file|
      Parchment.create( envelope_id: @envelope.id, file: file) unless file == ""
    end
    redirect_to "/" + @envelope.slug
  end

  private

  def find_envelope
    @envelope = Envelope.find_by_slug(params[:envelope_id])
  end


end
