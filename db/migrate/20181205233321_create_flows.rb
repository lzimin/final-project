class CreateFlows < ActiveRecord::Migration[5.1]
  def change
    create_table :flows do |t|
      t.integer :campaign_id
      t.string :flow_version
      t.string :flow_image
      t.integer :creator_id

      t.timestamps
    end
  end
end
