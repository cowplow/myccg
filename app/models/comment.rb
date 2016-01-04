class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :card

  validates :body, presence: true
end