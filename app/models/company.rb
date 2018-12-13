# == Schema Information
#
# Table name: companies
#
#  id           :integer          not null, primary key
#  company_name :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Company < ApplicationRecord

has_many :users, :dependent => :nullify
has_many :campaigns, :dependent => :nullify 
  
end
