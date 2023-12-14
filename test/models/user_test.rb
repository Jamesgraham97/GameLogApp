require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:one) # Assuming you have a fixture for the User model
    @user.encrypted_password = 'password123' # Set a non-nil password for Devise
  end

  test 'should not be valid without an email' do
    @user.email = nil
    assert_not @user.valid?
  end

  test 'should not be valid without a password' do
    # Devise manages the password internally, so focus on the presence of the password
    @user.encrypted_password = nil
    assert_not @user.valid?
  end

  test 'should not be valid without a username' do
    @user.username = nil
    assert_not @user.valid?
  end

  test 'should be valid with a unique username' do
    new_user = User.new(email: 'new_user@example.com', username: 'unique_username', password: 'password123')
    assert new_user.valid?
  end

  test 'should not be valid with a duplicate username' do
    new_user = User.new(email: 'new_user@example.com', username: @user.username, password: 'password123')
    assert_not new_user.valid?
  end
end
