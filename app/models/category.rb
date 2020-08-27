# frozen_string_literal: true

class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { minimum: 3, maximum: 32 }
  has_many :article_classifications
  has_many :articles, through: :article_classifications
end
