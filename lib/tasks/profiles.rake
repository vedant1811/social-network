namespace :profiles do
  desc 'Create 100 profiles with friendships'
  task seed: :environment do
    100.times do
      print '*'
      profile = Profile.new
      profile.name = Faker::Name.name
      profile.dob = Faker::Date.birthday
      profile.location = Faker::Address.city
      profile.gender = Profile.genders.keys.sample
      profile.photo_url = Faker::LoremPixel.image
      profile.save!

      rand(20).times do
        # ignore if Friendship.create fails
        begin
          Friendship.create profile_1: profile, profile_2: Profile.order(Arel.sql('random()')).first
          print '.'
        rescue ActiveRecord::RecordNotUnique
          print '-'
        end
      end
    end
    puts
  end
end
