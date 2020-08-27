# frozen_string_literal: true

class RelateUsersWithArticles < ActiveRecord::Migration[6.0]
  def change
    add_column(:articles, :user_id, :int)
  end
end
