class PostsController < ApplicationController
  before_action :logged_in_user, only: [:index, :show]
  before_action :admin_user, only: [:index, :show]

  def index
    @posts = Post.paginate(page: params[:page])
  end

  def show
  end

  def upload
    uploaded_io = params[:csv]
    loader = Loader.new(uploaded_io)

    loader.load

    # redirect_to action: 'index', page: 1
    redirect_to root_url
  end
end