require 'test_helper'

class CommentTest < ActiveSupport::TestCase

  def setup
    User.create(name: "Fulano", email:"fulano@example.com")
    user = User.first

    user.posts.build(title: "example", body:"example")
    post = Post.first    

    @comment = Comment.new(user_id: user.id, post_id: post.id, commentary: "commentary example") 
  end 

  test "should be valid" do
    assert @comment.valid?
  end

  test "user_id should be present" do
    @comment.user_id = nil
    assert_not @comment.valid?
  end
  
  test "post_id should be present" do
    @comment.post_id = nil
    assert_not @comment.valid?
  end

  test "commentary should be present" do
    @comment.commentary = " "
    assert_not @comment.valid?
  end
  
end
