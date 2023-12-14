require 'test_helper'

class GameTest < ActiveSupport::TestCase
  def setup
    @user = users(:one) # Assuming you have a fixture for the User model
  end

  test 'should be valid with valid attributes' do
    game = Game.new(title: 'Example Game', platform: 'Example Platform', user: @user)
    assert game.valid?
  end

  test 'should not be valid without a title' do
    game = Game.new(platform: 'Example Platform', user: @user)
    assert_not game.valid?
  end

  test 'should not be valid without a platform' do
    game = Game.new(title: 'Example Game', user: @user)
    assert_not game.valid?
  end

  test 'should be valid with a valid rating' do
    game = Game.new(title: 'Example Game', platform: 'Example Platform', rating: 4, user: @user)
    assert game.valid?
  end

  test 'should not be valid with a rating greater than 5' do
    game = Game.new(title: 'Example Game', platform: 'Example Platform', rating: 6, user: @user)
    assert_not game.valid?
  end

  test 'should not be valid with a rating less than 0' do
    game = Game.new(title: 'Example Game', platform: 'Example Platform', rating: -1, user: @user)
    assert_not game.valid?
  end
end
