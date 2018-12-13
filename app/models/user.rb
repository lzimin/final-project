# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  first_name             :string
#  last_name              :string
#  company_id             :integer
#  position               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
has_many :flow_comments, :dependent => :nullify
has_many :flows, :foreign_key => "creator_id", :dependent => :nullify
has_many :flow_approvals, :dependent => :destroy
has_many :approved_flows, :through => :flow_approvals, :source => :flow

has_many :created_campaigns, :class_name => "Campaign", :foreign_key => "creator_id", :dependent => :nullify
has_many :updated_campaigns, :class_name => "Campaign", :foreign_key => "last_updater_id", :dependent => :nullify
belongs_to :company



end
