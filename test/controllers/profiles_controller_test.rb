require 'test_helper'

class ProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @profile = profiles(:one)
  end

  test "should get index" do
    get profiles_url
    assert_response :success
  end

  test "should get new" do
    get new_profile_url
    assert_response :success
  end

  test "should create profile" do
    assert_difference('Profile.count') do
      post profiles_url, params: { profile: { dob: @profile.dob, gender: @profile.gender, location: @profile.location, name: @profile.name, photo_url: @profile.photo_url } }
    end

    assert_redirected_to profile_url(Profile.last)
  end

  test "should show profile" do
    get profile_url(@profile)
    assert_response :success
  end

  test "should get edit" do
    get edit_profile_url(@profile)
    assert_response :success
  end

  test "should update profile" do
    patch profile_url(@profile), params: { profile: { dob: @profile.dob, gender: @profile.gender, location: @profile.location, name: @profile.name, photo_url: @profile.photo_url } }
    assert_redirected_to profile_url(@profile)
  end
end
