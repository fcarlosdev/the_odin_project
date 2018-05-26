require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  let(:user) { create(:user) }

  before(:each) do
    visit "/"
    fill_in "login_mail", with: user.email
    fill_in "login_passwd", with: user.password
    click_button "Log in"
  end

  describe 'POST #create' do

    context "when a content is provided" do

      it "creates a new Post" do
        visit timeline_path(user)
        fill_in "text_content", with: "Lorem"
        expect { click_button "Post"}.to change(Post, :count).by(1)
      end

    end

    context "when a content is not provided" do

      it "doesn't create a new post" do
        post = Post.new
        visit timeline_path(user)
        fill_in "text_content", with: ""

        expect { click_button "Post"}.to change(post.class, :count).by(0)
        expect(post.valid?).to be false
        expect(post.errors.messages[:content][0]).to eq("can't be blank")
      end

    end

  end

  describe "DELETE posts#destroy" do

    context "When the post belongs to the current user" do
      it "should destroy a post" do
        create(:post, user: user)
        visit timeline_path(user)
        expect(page).to have_link("Delete")
        expect{ click_link "Delete"}.to change(Post, :count).by(-1)
      end
    end

    context "When the post belongs to a friend" do

      it "should turn out the post invisible" do
        friend = create(:friend)
        friend.posts = create_list(:post, 1, user: friend)
        user.friendships = create_list(:friendship, 1, friend: friend)
        visit timeline_path(user)
        expect(page).to have_link("Delete")
        click_link("Delete")
        expect(user.friends.first.posts.first.visible).to eq(false)
      end
    end
  end

end
