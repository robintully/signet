class ParchmentsController < ApplicationController

  def create
    params[:parchment][:parchment].each do |key,property|
      Parchment.create(s3_url: property, envelope_id: find_envelope.id) unless property == ""
    end
    redirect_to envelope_path(find_envelope)
  end

  private

  def find_envelope
    envelope = Envelope.find_by_slug(params[:envelope_id])
  end


end
