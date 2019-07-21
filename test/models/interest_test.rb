require 'test_helper'

class InterestTest < ActiveSupport::TestCase
  test 'associates interest and profile' do
    assert_difference 'profiles(:three).interests.count' do
      profiles(:three).interests << interests(:one)
    end
  end

  test "doesn't associate interest and profile" do
    assert_raise do
      profiles(:two).interests << interests(:two)
    end
  end

  test 'should destroy' do
    assert_difference 'Interest.count', -1 do
      interests(:two).destroy!
    end
  end

  test 'should not destroy profiles' do
    assert_no_difference 'Profile.count' do
      interests(:two).destroy!
    end
  end
end
