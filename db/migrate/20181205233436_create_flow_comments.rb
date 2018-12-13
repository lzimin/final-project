class CreateFlowComments < ActiveRecord::Migration[5.1]
  def change
    create_table :flow_comments do |t|
      t.integer :flow_id
      t.text :body
      t.integer :user_id

      t.timestamps
    end
  end
end
