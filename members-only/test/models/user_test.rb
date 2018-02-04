require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name:"Example User", email:"user@mail.com",
                     password: "foobar", password_confirmation: "foobar")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name shoud be valid" do
    @user.name = " "
    assert_not @user.valid?
  end

  test "email should be valid" do
    @user.email = " "
    assert_not @user.valid?
  end

  test "name should not to bee too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "email should not to bee too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

  test "validation should accept valid email address" do
    valid_addresses = %w[fcarlosbr@mail.com FCARLOSbr@maiL.com fcarlos123@mail.com
                         BR-PT@mail.com julia@foo.pt]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "validation should reject invalid email address" do
    invalid_addresses = %w[fcarlosbr@example,com user_at_foo.org user.name@example.
                         foo@bar_baz.com foo@bar+baz.com foo@bar..com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address} should be invalid"
    end
  end

  test "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end

  test "password should be valid (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

end
