# frozen_string_literal: true

class List < ApplicationRecord
  belongs_to :board
  has_many :tasks,
           -> { order(position: :asc) },
           dependent: :destroy
end

# == Schema Information
#
# Table name: lists
#
#  id         :bigint           not null, primary key
#  name       :string
#  position   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  board_id   :bigint           not null
#
# Indexes
#
#  index_lists_on_board_id  (board_id)
#
# Foreign Keys
#
#  fk_rails_...  (board_id => boards.id)
#
