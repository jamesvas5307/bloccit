class SponsoredpostsController < ApplicationController
	before_action :grab_topic, except: [:index]

    def show
      @sponsoredpost = @topic.sponsoredposts.find(params[:id])
    end

    def new
      @sponsoredpost = @topic.sponsoredposts.new
    end

    def create
 	 @sponsoredpost = @topic.sponsoredposts.build( sponsorpost_params )

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
      @sponsoredpost = @topic.sponsoredposts.find(params[:id])
    end

    def update
      @sponsoredpost = @topic.sponsoredposts.find(params[:id])

      if @sponsoredpost.update_attributes( sponsorpost_params )
        flash[:notice] = "Post was updated."
        redirect_to [ @sponsoredpost.topic, @sponsoredpost ]
      else
        flash.now[:alert] = "There was an error saving the post. Please try again"
        render :edit
      end
    end

    def destroy
      @sponsoredpost = @topic.sponsoredposts.find(params[:id])
      if @sponsoredpost.destroy
        flash[:notice] = "\"#{@sponsoredpost.name}\" was deleted successfully."
        redirect_to @sponsoredpost.topic
      else
        flash.now[:alert] = "There was an error deleting the post"
        render :show
      end
    end

    private

    def grab_topic
	  @topic = Topic.find(params[:topic_id])
    end

    def sponsorpost_params
	  params.require(:sponsoredpost).permit(:name, :body, :price)
    end

end
