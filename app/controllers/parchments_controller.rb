class ParchmentsController < ApplicationController

  def create
    binding.pry
    @parchment = Parchment.new(s3_url: parchment_params[:parcel], envelope_id: find_envelope.id)
    if @parchment.save
      redirect_to @parchment.envelope, notice: "upload successful"
    else
      render 'envelopes/show'
    end
  end

  private

  def parchment_params
    params.require(:parchment).permit(:parcel, :timestamp)
  end

  def find_envelope
    envelope = Envelope.find_by_slug(params[:envelope_id])
  end


end
