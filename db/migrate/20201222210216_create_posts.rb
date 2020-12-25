class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.text :content
      t.string :title
      t.string :subtitle
      t.boolean :draft, null: false, default: true
      t.timestamps
    end
  end
end
