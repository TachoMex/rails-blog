class User < ApplicationRecord
  validates :username, presence: true,
                       length: { minimum: 4, maximum: 32 },
                       uniqueness: { case_sensitive: false }
  validates :email, presence: true,
                    length: { minimum: 4, maximum: 105 },
                    uniqueness: { case_sensitive: false },
                    format: { with: URI::MailTo::EMAIL_REGEXP }
  has_many :articles
end
