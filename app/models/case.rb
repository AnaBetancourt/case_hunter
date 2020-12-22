class Case < ActiveRecord::Base
    belongs_to :hunter
    belongs_to :monster
end