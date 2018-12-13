# == Schema Information
#
# Table name: campaigns
#
#  id                   :integer          not null, primary key
#  company_id           :integer
#  campaign_title       :string
#  campaign_start       :datetime
#  campaign_end         :datetime
#  creator_id           :integer
#  last_updater_id      :integer
#  campaign_description :text
#  status               :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class Campaign < ApplicationRecord

belongs_to :creator, :class_name => "User"
belongs_to :last_updater, :class_name => "User"
has_many :flows, :dependent => :destroy
belongs_to :company

default_scope { order(updated_at: :desc) }

validates :campaign_title, presence: true
validates :campaign_start, presence: true
validates :campaign_end, presence: true
validates :campaign_description, presence: true
validates :creator_id, presence: true
validates :last_updater, presence: true
validates :status, presence: true

end
