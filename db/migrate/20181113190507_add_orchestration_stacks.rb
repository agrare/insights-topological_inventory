class AddOrchestrationStacks < ActiveRecord::Migration[5.1]
  def change
    create_table :orchestration_stacks do |t|
      t.references :tenant, :type => :bigint, :index => true, :null => false, :foreign_key => {:on_delete => :cascade}
      t.references :source, :type => :bigint, :index => true, :null => false, :foreign_key => {:on_delete => :cascade}

      t.string :source_ref
      t.string :name
      t.string :description

      t.timestamps
      t.datetime :archived_at
      t.datetime :source_created_at
      t.datetime :source_deleted_at

      t.index [:source_id, :source_ref], :unique => true
      t.index :archived_at
    end

    add_reference :vms, :orchestration_stack, :index => true, :foreign_key => {:on_delete => :nullify}
  end
end
