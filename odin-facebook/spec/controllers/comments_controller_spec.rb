require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

  let(:user) { create(:user) }

  before(:each) do
    sign_in user
  end


  describe "COMMENT #create" do

    context "when a content is provided" do

      it "creates a new Comment" do
        new_post = create(:post)
        expect { post :create, params: {comment: {body: "Good",
           post_id: new_post.id }} }.to change( Comment, :count).by(1)
      end

    end

    context "when a content is not provided" do

      it "doesn't create the comment" do

        new_post = create(:post)
        expect { post :create, params: {comment: {body: "",
           post_id: new_post.id}} }.to_not change(Comment, :count)

      end
    end

  end
end
