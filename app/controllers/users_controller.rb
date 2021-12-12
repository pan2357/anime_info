class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  before_action :logged_in, only: %i[ feed my_list ]
  before_action :platform_colors, only: %i[ feed ]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def register
    @user = User.new
  end

  def create_new_user
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to home_path, notice: "User was successfully created." }
      else
        format.html { render :register, status: :unprocessable_entity }
      end
    end
  end

  def login_page
    @user = User.new
  end

  def login
    @user = User.find_by(email: user_params[:email])
    if @user == nil
      redirect_to login_path, alert: "Email or Password incorrect"
    else
      if @user.authenticate(user_params[:password])
        redirect_to feed_path, notice: "You logged in successfully"
        session[:user_id] = @user.id
      else
        redirect_to login_path, alert: "Email or Password incorrect"
      end
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to home_path, notice: "You logged out successfully"
  end

  def feed
    @animes = @user.get_feed_anime
    @news = News.order('created_at DESC')
  end

  def my_list
    @lists = @user.mylists
  end

  private
    def logged_in
      if session[:user_id]
        @user = User.find(session[:user_id])
      else
        redirect_to login_path, alert: "Please log in first"
      end
    end

    def platform_colors
      @platform_color = {'iQIYI' => 'success', 'AIS PLAY' => 'success', 'Ani-One Asia' => 'danger', 'Muse Thailand' => 'danger', 'Bilibili' => 'info'}
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
