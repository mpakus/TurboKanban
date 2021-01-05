# frozen_string_literal: true

class Company < ApplicationRecord
  has_many :boards, dependent: :destroy
  has_many :memberships
  has_many :users, through: :memberships
end

# == Schema Information
#
# Table name: companies
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
