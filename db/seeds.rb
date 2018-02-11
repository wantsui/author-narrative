# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


writer = Writer.create!(username: 'writer_test_1', password: ENV['seed_file_writer_default_password'], bio: "This is a writer created as part of a test.", email: ENV['seed_file_writer_default_email'])

writer.stories.create!(title: 'The Programmer and the Rock Dove', description: 'A young rock dove decides to program.', share_work: true)
writer.stories.create!(title: 'Ruby & Python - The Null Value', description: 'Two characters find themselves at a standoff when all of code is in danger. They must work together to debug...or everything can be lost.', share_work: true, created_at: DateTime.now-2.day)
writer.stories.create!(title: 'Working Title#3', description: 'This might end up being a recipe book for people.', created_at: DateTime.now-1.day)
writer.stories.create!(title: 'Ghost Hunter & Dance WIP', description: "A ghost hunter enters a dance competition with ghosts. Will he succeed? Or will the ghosts succeed?", share_work: true, created_at: DateTime.now-1.day)
writer.stories.create!(title: 'Working Title#1', description: 'Still not sure yet.', share_work: true, created_at: DateTime.now-3.day)
