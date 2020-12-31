class AddNameToWriters < ActiveRecord::Migration[6.1]
  def change
    add_column :writers, :name, :string
  end
end
