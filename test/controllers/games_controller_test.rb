# test/controllers/games_controller_test.rb
require 'test_helper'
require 'devise'

class GamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one) 
    @game = games(:one) 
  end

  test 'should get index' do
    get games_url
    assert_response :success
  end

  test 'should get new' do
    sign_in @user
    get new_game_url
    assert_response :success
  end

  test 'should create game' do
    sign_in @user
    assert_difference('Game.count') do
      post games_url, params: { game: { title: 'New Game', platform: 'Platform', user_id: @user.id } }
    end

    assert_redirected_to game_url(Game.last)
  end

  test 'should show game' do
    get game_url(@game)
    assert_response :success
  end

  test 'should get edit' do
    sign_in @user
    get edit_game_url(@game)
    assert_response :success
  end

  test 'should update game' do
    sign_in @user
    patch game_url(@game), params: { game: { title: 'Updated Game' } }
    assert_redirected_to game_url(@game)
    @game.reload
    assert_equal 'Updated Game', @game.title
  end

  test 'should destroy game' do
    sign_in @user
    assert_difference('Game.count', -1) do
      delete game_url(@game)
    end

    assert_redirected_to games_url
  end

  test 'should show details' do
    get show_details_games_url, params: { search: @game.title }
    assert_response :success
  end
end
