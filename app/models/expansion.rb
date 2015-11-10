class Expansion < ActiveRecord::Base
  include SlugableCtrembley

  has_many :cards

  slugable_column :name
end