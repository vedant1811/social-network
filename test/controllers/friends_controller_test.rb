require 'test_helper'

class FriendsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @profile = profiles(:one)
  end

  test "should get suggestions" do
    get suggestions_profile_friends_url(@profile)
    assert_response :success
  end

  test "should create" do
    assert_difference('Friendship.count') do
      post profile_friends_url(@profile), params: { friend_id: profiles(:three).id }
    end

    assert_redirected_to suggestions_profile_friends_url(Profile.last)
  end

  test "should not create" do
    assert_no_difference('Friendship.count') do
      post profile_friends_url(@profile), params: { friend_id: profiles(:two).id }
    end

    assert_redirected_to suggestions_profile_friends_url(Profile.last)
  end

end
