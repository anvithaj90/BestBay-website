# This is the database migration for adding subtitle for categories
class AddSubtitleToCategories < ActiveRecord::Migration
  # change the number in database when some parameters change
  def change
    add_column :categories, :subtitle, :string
  end
end
