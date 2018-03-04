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
    filename = Rails.root.join('public', 'uploads',
                               uploaded_io.original_filename)
    File.open(filename, 'wb') do |file|
      file.write(uploaded_io.read)
    end

    loader = Loader.new(filename)
    loader.load

    redirect_to action: 'index', page: 1
  end
end