require "rails_helper"

RSpec.describe AddOffersController, :type => :controller do
  describe "POST #create" do
    it "responds successfully with an HTTP 200 status code" do
      p = Property.create!
      post :create, {property_id: p.id, add_offer: {percentage_financing: 10}}
      expect(response).to be_redirect

    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "loads all of the posts into @posts" do
      post1, post2 = Post.create!, Post.create!
      get :index

      expect(assigns(:posts)).to match_array([post1, post2])
    end
  end
end