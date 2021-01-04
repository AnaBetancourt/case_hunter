class Hunter < ActiveRecord::Base

    has_secure_password
    has_many :cases
    has_many :monsters, through: :cases
    validates :username, presence: true
    validates :username, uniqueness: true
    validates :email, presence: true
    
end