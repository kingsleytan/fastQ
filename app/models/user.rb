class User < ApplicationRecord
  has_secure_password

  enum role: [:user, :moderator, :admin]
  has_many :offices
  has_many :branches
  has_many :services
  has_many :tickets

  before_save { self.email = email.downcase }

  validates :username, presence:true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password_confirmation, presence: true, if: :password

  extend FriendlyId
  friendly_id :username, use: [:slugged, :history]

  before_save :update_slug

  private

  def update_slug
    if username
      self.slug = username.gsub(" ", "-")
    end
  end

end
