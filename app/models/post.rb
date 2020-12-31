class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  has_many :favorites, dependent: :destroy
  has_rich_text :content

  resourcify
  
  def should_generate_new_friendly_id?
    title_changed?
  end

  def self.published
    where(draft: false).order(created_at: :desc)
  end
  
  def self.ordered
    all.order(created_at: :desc)
  end
  
  def self.drafts
    where(draft: true).order(created_at: :desc)
  end
end
