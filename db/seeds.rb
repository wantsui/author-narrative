# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Writer.create!(username: 'writer_test_1', password: ENV['seed_file_writer_default_password'], bio: "I'm a new writer!", email: ENV['seed_file_writer_default_email'])
