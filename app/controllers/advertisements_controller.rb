class AdvertisementsController < ApplicationController
  def index
    @ads = Advertisement.all
  end

  def show
    @advertisement = Advertisement.find(params[:id])
  end

  def new
    @advertisement = Advertisement.new
  end

  def create
    @advertisement = Advertisement.new
    @advertisement.title = params[:advertisement][:title]
    @advertisement.body =  params[:advertisement][:body]
    @advertisement.price = params[:advertisement][:price]

    if @advertisement.save
      flash[:notice] = "Advertisement was saved."
      redirect_to @advertisement
    else
      # if no successful alert the user and render the new view again.
      flash.now[:alert] = "There was an error saving the ad. Please try again"
      render :new
    end
  end
end
