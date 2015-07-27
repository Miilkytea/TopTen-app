class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :image_url
      t.string :description

      t.integer :list_id

      t.timestamps null: false
    end
  end
end
