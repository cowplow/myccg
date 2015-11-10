class Card < ActiveRecord::Base
  include SlugableCtrembley
  
  belongs_to :expansions
  belongs_to :factions
  has_one :card_type

  slugable_column :name
end