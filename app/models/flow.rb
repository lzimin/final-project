# == Schema Information
#
# Table name: flows
#
#  id           :integer          not null, primary key
#  campaign_id  :integer
#  flow_version :string
#  flow_image   :string
#  creator_id   :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Flow < ActiveRecord::Base

mount_uploader :flow_image, FlowImageUploader

belongs_to :creator, :class_name => "User"
belongs_to :campaign
has_many :flow_comments, :dependent => :destroy
has_many :flow_approvals, :dependent => :destroy  
has_many :approvers, :through => :flow_approvals, :source => :user

default_scope { order(created_at: :desc) }

validates :flow_version, presence: true, uniqueness: { scope: :campaign_id, message: "flow version exists for this campaign" }
validates :flow_image, presence: true
validates :creator_id, presence: true
validates :campaign_id, presence: true
  
end
