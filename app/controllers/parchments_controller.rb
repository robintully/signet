class ParchmentsController < ApplicationController

  def create
    @parchment = Parchment.new(s3_url: parchment_params[:parcel], envelope_id: params[:envelope_id])
    if @parchment.save
      redirect_to @parchment.envelope, notice: "upload successful"
    else
      render 'envelopes/show'
    end
  end

  private

  def parchment_params
    params.require(:parchment).permit(:parcel)
  end


end
