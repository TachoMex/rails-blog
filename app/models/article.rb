# frozen_string_literal: true

class Article < ApplicationRecord
  validates :title, presence: true, length: { minimum: 4, maximum: 140 }
  validates :description, presence: true, length: { minimum: 4 }
  belongs_to :user
end
