require 'test_helper'
require 'byebug'
class StoryControllerTest < ActionDispatch::IntegrationTest
  setup do
    @writer = Writer.create!(username: 'writer_test_1', password: ENV['seed_file_writer_default_password'], bio: "This is a writer created as part of a test.", email: ENV['seed_file_writer_default_email'])
    @writer.stories.create!(title: 'The Programmer and the Rock Dove', description: 'A young rock dove decides to program.', share_work: true)
  end

  test "the writer's profile contains the correct bio information" do
    get "/writers/#{@writer.id}"
    assert response.body.include?(@writer.bio)
    assert response.body.include?(@writer.username)
    assert_response :success
  end
end
