# frozen_string_literal: true

class Board < ApplicationRecord
  belongs_to :user
  belongs_to :company, optional: true
  has_many :lists, dependent: :destroy

  validates :name, presence: true
end

# == Schema Information
#
# Table name: boards
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_boards_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
