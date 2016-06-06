class EnvelopesController < ApplicationController
  before_action :set_s3_direct_post, only: [:edit,:show]
  before_action :authenticated_only, only: [:create, :edit, :update]
  before_action :set_envelope, only: [:show, :edit, :update, :authenticate]

  def new
    @user = User.new
  end

  def create
    slug = WordGetter.random_word
    @envelope = Envelope.create(user: current_user, slug: slug)
    redirect_to  "/" + @envelope.slug
  end

  def show
    @envelope = Envelope.find_by_slug(params[:id])
    if @envelope.password_digest == nil
      session[:envelope_id] = @envelope.id
    end
    if @envelope.user == current_user || session[:envelope_id] == @envelope.id
      @parchments = @envelope.parchments
      session[:envelope_id] = nil
      render :show
    else
      render :enterpassword
    end
  end

  def authenticate
    if @envelope.authenticate(params[:password]) 
     session[:envelope_id] = @envelope.id
   end
   redirect_to  "/" + @envelope.slug
 end

 def index
  @envelopes = current_user.envelopes
end

def edit
end

def update
  @envelope.password = params[:password]
  @envelope.save
  redirect_to  "/" + @envelope.slug
end

private

def set_envelope
  @envelope = Envelope.find_by_slug(params[:id])
end

def set_s3_direct_post
  @s3_direct_post = S3_BUCKET.presigned_post(key: "uploads/#{SecureRandom.uuid}/${filename}", success_action_status: '201', acl: 'public-read')
end

end
