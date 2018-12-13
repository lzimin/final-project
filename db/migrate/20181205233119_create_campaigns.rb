class CreateCampaigns < ActiveRecord::Migration[5.1]
  def change
    create_table :campaigns do |t|
      t.integer :company_id
      t.string :campaign_title
      t.datetime :campaign_start
      t.datetime :campaign_end
      t.integer :creator_id
      t.integer :last_updater_id
      t.text :campaign_description
      t.string :status

      t.timestamps
    end
  end
end
