class ParchmentsController < ApplicationController

  def create
    params[:attachment][:file].each do |file|
      Parchment.create( envelope_id: find_envelope.id, file: file) unless file == ""
    end
    redirect_to envelope_path(find_envelope)
  end

  private

  def find_envelope
    envelope = Envelope.find_by_slug(params[:envelope_id])
  end


end
