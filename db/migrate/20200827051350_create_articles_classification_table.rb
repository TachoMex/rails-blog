# frozen_string_literal: true

class CreateArticlesClassificationTable < ActiveRecord::Migration[6.0]
  def change
    create_table :article_classifications do |t|
      t.integer :article_id
      t.integer :category_id
    end
  end
end
