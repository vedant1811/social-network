class FriendsController < ApplicationController
  before_action :set_profile

  def suggestions
  end

  def create
    @friend = Profile.find(params[:friend_id])
    begin
      Friendship.create profile_1: @profile, profile_2: @friend
      flash[:notice] = "#{@friend.name} added as friend"
    rescue ActiveRecord::RecordNotUnique
      flash[:notice] = "#{@friend.name} is already a friend"
    end

    redirect_to suggestions_profile_friends_path(@profile)
  end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_profile
    @profile = Profile.find(params[:profile_id])
  end
end
