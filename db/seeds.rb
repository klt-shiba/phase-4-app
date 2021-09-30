# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([{ username: 'gordon', email: 'gordon@email.com', password: "1234", password_confirmation: "1234" }, 
                     { username: 'garry', email: 'garry@email.com', password: "1234", password_confirmation: "1234" },
                     { username: 'bram', email: 'bram@email.com', password: "1234", password_confirmation: "1234" },
                     { username: 'heena', email: 'heena@email.com', password: "1234", password_confirmation: "1234" },
                     { username: 'camille', email: 'camille@email.com', password: "1234", password_confirmation: "1234" },
                     { username: 'ash', email: 'ash@email.com', password: "1234", password_confirmation: "1234" },
                     { username: 'simon', email: 'simon@email.com', password: "1234", password_confirmation: "1234" }
                    ])

jobs = Job.create([{}])

        