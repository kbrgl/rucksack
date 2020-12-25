class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  has_many :favorites
  has_rich_text :content

  validates :title, :subtitle, :content, presence: true
end
