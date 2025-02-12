class Post < ApplicationRecord
  belongs_to :user
  belongs_to :community
  has_many :comments
  has_many :votes, as: :votable

  # Add this line to your Gemfile if not present
  # gem 'active_storage_validations'

  # Update the validation to use has_one_attached
  has_one_attached :image
  validates :image, content_type: ['image/png', 'image/jpeg']
end
