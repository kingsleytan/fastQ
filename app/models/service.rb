class Service < ApplicationRecord
  belongs_to :branch
  has_many :tickets
  has_many :lineups

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
