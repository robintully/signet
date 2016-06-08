class EnvelopesController < ApplicationController
  before_action :set_s3_direct_post, only: [:edit,:show]
  before_action :authenticated_only, only: [:create, :edit, :update]
  before_action :set_envelope, only: [:show, :edit, :update, :authenticate]

  def new
    @envelope = Envelope.new
    @times = ExpirationSetter.expiration_options
    @user = User.new
  end

  def create
    slug = WordGetter.random_word
    expiration = ExpirationSetter.set_expiration(params[:envelope][:expiration])
    @envelope = Envelope.create(user: current_user, slug: slug, expiration: expiration)
    redirect_to  "/" + @envelope.slug
  end

  def show
    if @envelope == nil
      redirect_to root_path, flash: {error: "That's not a valid envelope"}
    elsif @envelope.password_digest == nil
      session[:envelope_id] = @envelope.id
    elsif @envelope.user == current_user || session[:envelope_id] == @envelope.id
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
   render :show
 end

 def index
<<<<<<< HEAD
  @envelopes = current_user.envelopes
=======
    @envelopes = current_user.envelopes
>>>>>>> bc76101967480aa83c8454d16d7cef1dc2bac162
  end

  def edit
  end

  def update
    @envelope.password = params[:password]
    @envelope.save
<<<<<<< HEAD
    redirect_to  "/" + @envelope.slug
=======
    render :show
>>>>>>> bc76101967480aa83c8454d16d7cef1dc2bac162
  end

  private

  def set_envelope
<<<<<<< HEAD
    @envelope = Envelope.find_by_slug(params[:id])
=======
    @envelope = Envelope.find_by_slug(params[:slug])
>>>>>>> bc76101967480aa83c8454d16d7cef1dc2bac162
  end

  def set_s3_direct_post
    @s3_direct_post = S3_BUCKET.presigned_post(key: "uploads/#{SecureRandom.uuid}/${filename}", success_action_status: '201', acl: 'public-read')
  end

end
