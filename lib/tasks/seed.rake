namespace :seed do
  desc 'Create 10 interests associated to profiles'
  task interests: :environment do
    10.times do
      interest = Interest.new
      interest.name = Faker::Food.dish
      interest.save!
      print 'x'
    end
    puts
  end

  desc 'Create 10 interests, and 10k profiles with friendships and interests'
  task profiles: :interests do
    # Heroku allows max 20 connections
    18.times.map do |e|
      puts e
      Thread.new do
        create_profiles
      end
    end
      .map(&:join)
    puts
  end

  def create_profiles
    # 18 * 556 = 10,008
    556.times do |e|
      begin
        profile = Profile.new
        profile.name = Faker::Name.name
        profile.dob = Faker::Date.birthday
        profile.location = Faker::Address.city
        profile.gender = Profile.genders.keys.sample
        profile.photo_url = random_url
        profile.interests = Interest.order(Arel.sql('random()')).limit(rand(7))
        profile.save!
        print e

        rand(20).times do
          # ignore if Friendship.create fails
          begin
            Friendship.create profile_1: profile, profile_2: Profile.order(Arel.sql('random()')).first
            print '.'
          rescue ActiveRecord::RecordNotUnique
            print '-'
          end
        end
      rescue ActiveRecord::ConnectionTimeoutError, RuntimeError => err
        # Log and ignore error
        print "#{e}-#{err}"
      end
    end
  end

  def random_url
    "https://picsum.photos/id/#{rand 1000}/200/200"
  end
end
