# frozen_string_literal: true

class ArticleClassification < ApplicationRecord
  belongs_to :article
  belongs_to :category
end
