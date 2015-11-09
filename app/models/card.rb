class Card < ActiveRecord::Base
  belongs_to :expansions
  belongs_to :factions
  has_one :card_type
end