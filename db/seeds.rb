ActiveRecord::Base.transaction do
  # company = Company.find_or_create_by(name: 'aömega')
  user = User.find_or_create_by(email: 'user@example.com', name: 'User') do |u|
    u.password = 'Password123'
  end
  user.confirm
  # Membership.create!(company: company, user: user)

  board1 = user.boards.create(name: 'Kanban Board')
  # board2 = user.boards.create(name: 'aomega.co')

  board1.lists.create(name: 'Backlog', position: 0)
  board1.lists.create(name: 'Doing', position: 1)
  board1.lists.create(name: 'QA', position: 2)
  board1.lists.create(name: 'Done', position: 3)
end
