class RemoveDateFromArticles < ActiveRecord::Migration[5.0]
  def change
    remove_column :articles, :date, :date
  end
end
