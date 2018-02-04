require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
    post users_path, params: { user: { name:  "",
                                       email: "user@invalid",
                                       password:              "foo",
                                       password_confirmation: "bar" } }
    end
    assert_template 'users/new'
    assert_select 'div#error_explanation .alert', "The form contains 4 errors."
    assert_select 'div.alert'
    assert_select 'div.alert-danger'
  end

  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: {name: "Example User",
                                        email:"example@mail.com",
                                        password:              "foobar",
                                        password_confirmation: "foobar"}}
    end
    follow_redirect!
    assert_template 'users/show'
    assert_not flash.empty?
    assert_includes(flash[:success],"Welcome Example User")
    assert is_logged_in?
  end

end
