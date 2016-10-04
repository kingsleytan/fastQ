class Branch < ApplicationRecord
  belongs_to :office
  has_many :services

  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]

  before_save :update_slug

  private

  def update_slug
    if name
      self.slug = name.gsub(" ", "-")
    end
  end

end
