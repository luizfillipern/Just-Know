class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :description
      t.text :content
      t.integer :user_id
      t.string :level

      t.timestamps
    end
  end
end
