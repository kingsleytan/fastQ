class Office < ApplicationRecord
mount_uploader :image, ImageUploader

  has_many :branches

  extend FriendlyId
  friendly_id :company, use: [:slugged, :history]
  before_save :update_slug

  private

  def update_slug
    if company
      self.slug = company.gsub(" ", "-")
    end
  end

end
