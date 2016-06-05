class ParchmentsController < ApplicationController

  def create
    binding.pry
    @parchment = Parchment.new(parchment_params)
    @parchment.envelope = Envelope.find(params[:envelope_id])
    if @parchment.save
      redirect to @parchment.envelope, notice: "upload successful"
    else
      render 'envelopes/show'
    end
  end

  private

  def parchment_params
    params.require(:parchment).permit(:parcel)
  end


end
