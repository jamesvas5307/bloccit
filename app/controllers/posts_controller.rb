class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    # Here we call a new instance of post
    @post = Post.new
    @post.title = params[:post][:title]
    @post.body = params[:post][:body]

    # if successful save Post to the database. And display a successful notice using flash.
    # Then redirect the user back to the post to show the user
    if @post.save
      flash[:notice] = "Post was saved."
      redirect_to @post
    else
      # if no successful alert the user and render the new view again.
      flash.now[:alert] = "There was an error saving the post. Please try again"
      render :new
    end
  end

  def edit
  end
end
