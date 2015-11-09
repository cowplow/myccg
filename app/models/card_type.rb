class CardType < ActiveRecord::Base
  belongs_to :card
  has_many :card_subtypes
end