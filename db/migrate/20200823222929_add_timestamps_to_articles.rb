class AddTimestampsToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :created_at, :datetime, null: false, default: Time.zone.now
    add_column :articles, :updated_at, :datetime, null: false, default: Time.zone.now
  end
end
