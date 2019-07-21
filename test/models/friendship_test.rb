require 'test_helper'

class FriendshipTest < ActiveSupport::TestCase
  test 'all friends' do
    assert_equal 2, profiles(:two).friends.count
  end
end
