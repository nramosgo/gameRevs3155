class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :mainText
      t.date :date
      t.string :image
      t.string :tag1
      t.string :tag2
      t.string :tag3
      t.references :account, foreign_key: true

      t.timestamps
    end
  end
end
