class AddVmsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :vms do |t|
      t.references :tenant, :type => :bigint, :index => true, :null => false, :foreign_key => {:on_delete => :cascade}
      t.references :source, :type => :bigint, :index => true, :null => false, :foreign_key => {:on_delete => :cascade}

      t.string :source_ref
      t.string :uuid
      t.string :vendor
      t.string :name
      t.string :hostname
      t.string :description
      t.string :power_state
      t.bigint :cpus
      t.bigint :memory

      t.timestamps
      t.datetime :archived_at
      t.datetime :source_created_at
      t.datetime :source_deleted_at

      t.index [:source_id, :source_ref], :unique => true
      t.index :archived_at
    end
  end
end