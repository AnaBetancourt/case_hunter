class Case < ActiveRecord::Base

    belongs_to :hunter
    belongs_to :monster
    validates :name, presence: true
    validates :name, uniqueness: true
    validates :location, presence: true
    validates :description, presence: true
    
end