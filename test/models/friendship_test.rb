require 'test_helper'

class FriendshipTest < ActiveSupport::TestCase
  test 'friends' do
    assert_equal 2, profiles(:two).friends.count
  end

  test 'friends of friends' do
    assert_equal [profiles(:three)], profiles(:one).friends_of_friends
  end
end
