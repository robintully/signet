class EnvelopesController < ApplicationController
  before_action :set_s3_direct_post, only: [:edit,:show]
  before_action :authenticated_only, only: [:create, :edit, :update]
  before_action :set_envelope, only: [:show, :edit, :update]

  def new
    @user = User.new
  end

  def create
    slug = WordGetter.random_word
    @envelope = Envelope.create(user: current_user, slug: slug)
    redirect_to envelope_path(@envelope)
  end

  def show
    @envelope = Envelope.find_by_slug(params[:id])
    @parchments = @envelope.parchments
  end

  def index
    @envelopes = current_user.envelopes
  end


  def edit
  end

  def update

  end

  private

  def set_envelope
    @envelope = Envelope.find_by_slug(params[:id])
  end

  def set_s3_direct_post
    @s3_direct_post = S3_BUCKET.presigned_post(key: "uploads/#{SecureRandom.uuid}/${filename}", success_action_status: '201', acl: 'public-read')
  end

end
