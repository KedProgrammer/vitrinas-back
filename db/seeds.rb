# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: "Daniel", password: "123456")
Employee.create(name: "Daniel", last_name: "tobon")
Employee.first.loans.create(amount: 1000, interest_rate: 0.4, period_type: :weekly, period_number: 5)
