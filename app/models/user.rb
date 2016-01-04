class User < ActiveRecord::Base
  include SlugableCtrembley

  has_many :comments

  has_secure_password validation: false

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, on: :create, length: { minimum: 5 }

  slugable_column :username

  def is_admin?
    self.authority >= 100
  end

  def is_super_user?
    self. authority >= 50
  end
end