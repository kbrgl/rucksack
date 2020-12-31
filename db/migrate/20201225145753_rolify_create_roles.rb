class RolifyCreateRoles < ActiveRecord::Migration[6.1]
  def change
    create_table(:roles) do |t|
      t.string :name
      t.references :resource, :polymorphic => true

      t.timestamps
    end

    create_table(:writers_roles, :id => false) do |t|
      t.references :writer
      t.references :role
    end
    
    add_index(:roles, :name)
    add_index(:roles, [ :name, :resource_type, :resource_id ])
    add_index(:writers_roles, [ :writer_id, :role_id ])
  end
end
