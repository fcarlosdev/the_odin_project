require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) { build(:user) }
  let(:post) { build(:post)}

  it 'a new user has no posts' do
    expect(user.posts).to be_empty
  end

  it 'the first post is not nil' do
    user.posts << post
    expect(user.posts.first).to_not be_nil
  end


end
