class Profile < ApplicationRecord
  enum gender: [ :male, :female ]

  validates :name, presence: true, blank: false

  def age
    dob && ((Time.zone.now - dob.to_time) / 1.year.seconds).floor
  end
end
