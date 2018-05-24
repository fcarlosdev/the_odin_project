require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  let(:user) { create(:user) }

  before(:each) do
    visit "/"
    fill_in "login_mail", with: user.email
    fill_in "login_passwd", with: user.password
    click_button "Log in"
  end

  context 'GET #index' do

    it 'returns a success response' do
      get 'index'
      expect(response).to be_success
      expect(assigns(:users)).to_not be_nil
    end

  end

  context 'GET #timeline' do
    render_views

    it 'should show the timeline page' do
      posts = create_list(:post, 10, user: user)
      visit timeline_path(user)

      posts.each do |post|
        expect(page).to have_content(post.content)
        expect(page).to have_content("less than a min")
      end
    end

  end

  context 'GET #friends' do

    render_views

    it 'lists the friends of the current user' do
      user.friendships = create_list(:friendship, 4, user: user)
      visit "/friends/#{user.id}"

      user.friends.each do |friend|
         expect(page).to have_content(friend.first_name)
      end
      expect(page).to have_current_path(friends_path(user))

    end

  end

end
