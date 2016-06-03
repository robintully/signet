class ParchmentsController < ApplicationController
  def create
    binding.pry
    @parchment = Parchment.new(parchment_params)

    if @parchment.save
      redirect to @parchment.envelope, notice: "upload successful"
    else
      render 'envelopes/show'
    end
  end

  def parchment_params
    params.require(:envelope).permit(:parchment)
  end
end
