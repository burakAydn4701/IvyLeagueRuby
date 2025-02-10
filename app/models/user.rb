class User < ApplicationRecord
    has_secure_password
    
    has_many :posts
    has_many :comments
    has_many :community_memberships
    has_many :communities, through: :community_memberships
    has_one_attached :pp
    
    validates :username, presence: true, uniqueness: true, length: { minimum: 3, maximum: 20 }
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :bio, length: { maximum: 500 }, allow_blank: true
    validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

    def admin?
        admin
    end
end
  