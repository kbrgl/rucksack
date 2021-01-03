class CreateNewsletters < ActiveRecord::Migration[6.1]
  def change
    create_table :newsletters do |t|
      t.string :title
      t.string :description
      t.text :about
      t.string :accent_color
      t.string :from_name
      t.string :from_email
      t.string :to
      t.string :author

      t.timestamps
    end
  end
end
