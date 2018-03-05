class UsersController < ApplicationController
  before_action :logged_in_user, only:[:index, :scoreboard]

  def show
    @user = User.find params[:id]
    if !@user.post_id.nil?
      puts "STARI: #{@user.post_id}"
      @post = Post.find_by(id: @user.post_id).next
      puts "NOVI: #{@post.id}"
    else
      @post = Post.first
      puts 'UZEO PRVI JEBENO SKK'
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = 'Welcome to Oversource! WORK FOR US. NOW.'
      redirect_to @user
    else
      render 'new'
    end
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  def scoreboard

  end

  def label
    @post = Post.find_by(id: params[:post_id])
    @user = User.find_by(id: params[:user_id])
    unless @post.nil? && @user.nil?
      unless params[:value].nil?
        Label.create(user: @user, post: @post, value: params[:value])
        @user.post_id = @post.id
        @user.save
      end
    end

    redirect_to @user
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
