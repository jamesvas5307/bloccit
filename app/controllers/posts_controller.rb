class PostsController < ApplicationController

  before_action :require_sign_in, except: [:show]
  before_action :grab_topic, except: [:index]



  def show
    @post = @topic.posts.find(params[:id])
  end

  def new
    @post = @topic.posts.new
  end

  def create
    # Here we call a new instance of post

    @post = @topic.posts.build ( post_params )
    @post.user = current_user

    # if successful save Post to the database. And display a successful notice using flash.
    # Then redirect the user back to the post to show the user
    if @post.save
      flash[:notice] = "Post was saved."
      redirect_to [ @topic, @post ]
    else
      # if no successful alert the user and render the new view again.
      flash.now[:alert] = "There was an error saving the post. Please try again"
      render :new
    end
  end

  def edit
    @post = @topic.posts.find(params[:id])
  end

  def update
    @post = @topic.posts.find(params[:id])


    if @post.update_attributes( post_params )
      flash[:notice] = "Post was updated."
      redirect_to [ @post.topic, @post ]
    else
      flash.now[:alert] = "There was an error saving the post. Please try again"
      render :edit
    end
  end

  def destroy
    @post = @topic.posts.find(params[:id])
    if @post.destroy
      flash[:notice] = "\"#{@post.title}\" was deleted successfully."
      redirect_to @post.topic
    else
      flash.now[:alert] = "There was an error deleting the post"
      render :show
    end
  end


  private
  def post_params
    params.require(:post).permit( :title, :body )
  end

  def grab_topic
    @topic = Topic.find(params[:topic_id])
  end
end
