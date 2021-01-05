# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do
  company = Company.find_or_create_by(name: 'aömega')
  user = User.find_or_create_by(email: 'renat@aomega.co', name: 'MpaK') do |u|
    u.password = 'Password1'
  end
  user.confirm
  Membership.create!(company: company, user: user)

  board1 = company.boards.create(name: 'Telle')
  board2 = company.boards.create(name: 'AstrumHQ')

  board1.lists.create(name: 'Backlog', position: 0)
  board1.lists.create(name: 'Doing', position: 1)
  board1.lists.create(name: 'QA', position: 2)
  board1.lists.create(name: 'Done', position: 3)
end
