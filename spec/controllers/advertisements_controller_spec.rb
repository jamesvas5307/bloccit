require 'rails_helper'

RSpec.describe AdvertisementsController, type: :controller do

  let(:my_ad){Advertisement.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, price: RandomData.random_number)}

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns [my_ad] to @advertisement" do
      get :index
      expect(assigns(:ads)).to eq([my_ad])
    end
  end



  describe "GET show" do
    it "returns http success" do
      get :show, {id: my_ad.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, {id: my_ad.id}
      expect(response).to render_template :show
    end

    it "assigns my_ad to @ad" do
      get :show, {id:my_ad.id}
      expect(assigns(:advertisement)).to eq(my_ad)
    end
  end

   describe "GET new" do

    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "render the #new view" do
      get :new
      expect(response).to render_template :new
    end

    it "instantiates @advertisement" do
      get :new
      expect(assigns(:advertisement)).not_to be_nil
    end

   end




  # describe "GET #edit" do
  #  it "returns http success" do
  #    get :edit
  #    expect(response).to have_http_status(:success)
  #  end
  # end

 end