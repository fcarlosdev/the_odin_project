require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do

  let(:user) {create(:user)}

  before(:each) do
    sign_in user
  end

  describe "PROFILE #show" do

    it "shows user profile" do
      profile = create(:profile, user: user)
      get :show, params: {id: profile.id}
      expect(response).to render_template("show")
    end

  end

  describe "PROFILE #edit" do

    it "shows edit profile page" do
      profile = create(:profile, user: user)
      get :edit, params: {id: profile.id}
      expect(response).to render_template("edit")
    end

  end

  describe "PROFILE #update" do

    it "updates user profile" do
      profile = create(:profile, user: user)
      patch :update, params: {id: profile.id,
                              profile: { about_me: "Like TV Shows" }}
      profile.reload
      expect(profile.about_me).to eq("Like TV Shows")
      expect(response).to redirect_to(profile)
    end
  end

end
