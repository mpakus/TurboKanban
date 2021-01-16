# frozen_string_literal: true

class Membership < ApplicationRecord
  CATEGORIES = %w[owner admin user].freeze
  belongs_to :company
  belongs_to :user
end

# == Schema Information
#
# Table name: memberships
#
#  id         :bigint           not null, primary key
#  category   :string(32)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  company_id :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_memberships_on_category    (category)
#  index_memberships_on_company_id  (company_id)
#  index_memberships_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (user_id => users.id)
#
