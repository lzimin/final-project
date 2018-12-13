class CreateFlowApprovals < ActiveRecord::Migration[5.1]
  def change
    create_table :flow_approvals do |t|
      t.integer :user_id
      t.integer :flow_id

      t.timestamps
    end
  end
end
