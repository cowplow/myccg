class Card < ActiveRecord::Base
  include SlugableCtrembley
  
  belongs_to :expansion
  belongs_to :faction
  has_one :card_type
  has_many :comments
  has_many :card_subtypes

  validates :name, presence: true, uniqueness: true

  slugable_column :name
end