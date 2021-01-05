class Task < ApplicationRecord
  belongs_to :list

  # broadcasts
  # broadcasts_to :list
  after_create_commit  -> { broadcast_append_to "list_#{list.id}", target: "list_#{list.id}", partial: 'boards/tasks/task' }
  after_update_commit  -> { broadcast_replace_to "list_#{list.id}", target: "list_#{list.id}", partial: 'boards/tasks/task' }
  after_destroy_commit -> { broadcast_remove_to "list_#{list.id}", target: "list_#{list.id}" }
end

# == Schema Information
#
# Table name: tasks
#
#  id          :bigint           not null, primary key
#  description :text
#  name        :string
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
