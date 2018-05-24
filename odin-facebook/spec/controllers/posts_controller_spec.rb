require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  let(:user) { create(:user) }

  before(:each) do
    visit "/"
    fill_in "login_mail", with: user.email
    fill_in "login_passwd", with: user.password
    click_button "Log in"
    # sign_in user
  end

  describe 'POST #create' do

    context "when a content is provided" do

      it "creates a new Post" do
        visit timeline_path(user)
        fill_in "content", with: "Lorem"
        expect { click_button "Post"}.to change(Post, :count).by(1)
      end

    end

    context "when a content is not provided" do

      it "doesn't create a new post" do
        post = Post.new
        visit timeline_path(user)
        fill_in "content", with: ""

        expect { click_button "Post"}.to change(post.class, :count).by(0)
        expect(post.valid?).to be false
        expect(post.errors.messages[:content][0]).to eq("can't be blank")
      end

    end
  end

end
