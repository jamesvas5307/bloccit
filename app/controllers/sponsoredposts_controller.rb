class SponsoredpostsController < ApplicationController

    def show
      @sponsoredpost= Sponsoredpost.find(params[:id])
    end

    def new
      @topic = Topic.find(params[:topic_id])
      @sponsoredpost = Sponsoredpost.new
    end

    def create
      # Here we call a new instance of post
      @sponsoredpost = Sponsoredpost.new
      @sponsoredpost.name = params[:sponsoredpost][:name]
      @sponsoredpost.body = params[:sponsoredpost][:body]
      @sponsoredpost.price = params[:sponsoredpost][:price]
      @topic = Topic.find(params[:topic_id])
      @sponsoredpost.topic = @topic

      # if successful save Post to the database. And display a successful notice using flash.
      # Then redirect the user back to the post to show the user
      if @sponsoredpost.save
        flash[:notice] = "Post was saved."
        redirect_to [ @topic, @sponsoredpost ]
      else
        # if no successful alert the user and render the new view again.
        flash.now[:alert] = "There was an error saving the post. Please try again"
        render :new
      end
    end

    def edit
      @sponsoredpost = Sponsoredpost.find(params[:id])
    end

    def update
      @sponsoredpost = Sponsoredpost.find(params[:id])
      @sponsoredpost.name = params[:sponsoredpost][:name]
      @sponsoredpost.body = params[:sponsoredpost][:body]
      @sponsoredpost.price = params[:sponsoredpost][:price]

      if @sponsoredpost.save
        flash[:notice] = "Post was updated."
        redirect_to [ @sponsoredpost.topic, @sponsoredpost ]
      else
        flash.now[:alert] = "There was an error saving the post. Please try again"
        render :edit
      end
    end

    def destroy
      @sponsoredpost = Sponsoredpost.find(params[:id])
      if @sponsoredpost.destroy
        flash[:notice] = "\"#{@sponsoredpost.name}\" was deleted successfully."
        redirect_to @sponsoredpost.topic
      else
        flash.now[:alert] = "There was an error deleting the post"
        render :show
      end
    end
end
