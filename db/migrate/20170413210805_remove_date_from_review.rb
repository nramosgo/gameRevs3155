class RemoveDateFromReview < ActiveRecord::Migration[5.0]
  def change
    remove_column :reviews, :date, :date
  end
end
