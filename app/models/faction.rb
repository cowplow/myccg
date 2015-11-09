class Faction < ActiveRecord::Base
  has_many :cards
end