class Post < ApplicationRecord
  belongs_to :user
  belongs_to :community
  has_many :comments
  has_many :votes, as: :votable

  has_one_attached :image # This adds support for attaching an image

  # Validations for image
  validates :image, content_type: ['image/png', 'image/jpg', 'image/jpeg'], size: { less_than: 5.megabytes }
end
