class DropCompanyIdFromBoards < ActiveRecord::Migration[6.1]
  def up
    remove_column :boards, :company_id
  end

  def down
    add_reference :boards, :company, null: false, foreign_key: true
  end
end
