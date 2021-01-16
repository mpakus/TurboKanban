# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :list
  acts_as_list scope: :list

  after_create_commit  -> { broadcast_append_to list, target: list, partial: 'boards/tasks/task' }
  after_update_commit  -> { broadcast_replace_to list, target: self, partial: 'boards/tasks/task' }
  after_destroy_commit -> { broadcast_remove_to list, target: self }

  validates :name, presence: true
end

# == Schema Information
#
# Table name: tasks
#
#  id          :bigint           not null, primary key
#  description :text
#  name        :string
#  position    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  list_id     :bigint           not null
#
# Indexes
#
#  index_tasks_on_list_id  (list_id)
#
# Foreign Keys
#
#  fk_rails_...  (list_id => lists.id)
#
