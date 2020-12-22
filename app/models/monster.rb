class Monster < ActiveRecord::Base
    has_many :cases
    has_many :hunters, through: :cases
end