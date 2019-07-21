require 'test_helper'

class ProfileTest < ActiveSupport::TestCase
  test 'creates profile' do
    profile = Profile.new
    profile.name = 'John'
    profile.gender = :male
    profile.save!
  end

  # TODO:
  # test 'destroys profile' do
  #   profile = profiles(:one)
  #   profile.destroy!
  # end
end
