class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :title
      t.string :image_url
      t.string :description
      t.string :topic
      t.integer :user_id

      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
