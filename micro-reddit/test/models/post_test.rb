require 'test_helper'

class PostTest < ActiveSupport::TestCase
 
  def setup
    @user = User.new(name: "Fulano", email: "fulano@example.com")
    @user.save
    @post = Post.new(title: "Example post", body: "First post")
  end

  test "should be valid" do    
    @post.user_id = @user.id
    assert @post.valid?
  end
  
  test "title shoud be present" do
    @post.title = " "
    assert_not @post.valid?
  end

  test "body should be present" do
    @post.body = " "
    assert_not @post.valid?
  end

  test "title should not be too long" do
    @post.title = "t" * 51
    assert_not @post.valid?
  end
  
  test "body should not be too long" do
    @post.body = "b" * 201
    assert_not @post.valid?
  end
end
