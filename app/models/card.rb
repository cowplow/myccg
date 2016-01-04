class Card < ActiveRecord::Base
  include SlugableCtrembley
  
  belongs_to :expansion
  belongs_to :faction
  has_and_belongs_to_many :card_types
  has_and_belongs_to_many :card_subtypes
  has_many :comments

  validates :name, presence: true, uniqueness: true

  slugable_column :name
end