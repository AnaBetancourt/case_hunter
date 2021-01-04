class Monster < ActiveRecord::Base

    has_many :cases
    has_many :hunters, through: :cases
    validates :species, presence: true
    validates :species, uniqueness: true
    validates :lore, presence: true
    validates :how_to_kill, presence: true
    
end