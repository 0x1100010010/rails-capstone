# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create!([{ name: 'x', username: 'x' }, { name: 'y', username: 'y' }, { name: 'z', username: 'z' } ])

users.each do |user|
  user.transactions.create!([{ name: 'transaction_by_'+user.name+'_i', amount: 100 }, { name: 'transaction_by_'+user.name+'_ii', amount: 200 }, { name: 'transaction_by_'+user.name+'_iii', amount: 300 }])
end

