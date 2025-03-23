class JobSeeker < ApplicationRecord
    has_one_attached :profile_image
    validates :full_name, presence: true
    validates :email, presence: true
    validates :mobile, presence: true, length: { is: 10 }
    validates :address, presence: true
    validates :date_of_birth, presence: true
    
end
