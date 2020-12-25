class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.references :post, index: true, foreign_key: true
      t.references :subscriber, index: true, foreign_key: true
      t.timestamps
    end
  end
end
