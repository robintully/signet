class EnvelopesController < ApplicationController
  before_action :set_s3_direct_post, only: [:show]

  def new
  end

  def create
    binding.pry
    @envelope = Envelope.create(user: User.first)
    redirect_to @envelope
  end

  def show
    @envelope = Envelope.find(params[:id])
  end

  private

  def set_s3_direct_post
    @s3_direct_post = S3_BUCKET.presigned_post(key: "uploads/#{SecureRandom.uuid}/${filename}", success_action_status: '201', acl: 'public-read')
  end

end
