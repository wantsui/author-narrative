require 'test_helper'
require 'byebug'

class WriterControllerTest < ActionDispatch::IntegrationTest
  setup do
    writer = Writer.create!(username: 'writer_test_1', password: ENV['seed_file_writer_default_password'], bio: "This is a writer created as part of a test.", email: ENV['seed_file_writer_default_email'])
    writer.stories.create!(title: 'The Programmer and the Rock Dove', description: 'A young rock dove decides to program.', share_work: true)
  end

  test "index is successful" do
    get writers_path
    assert_response :success
  end

  test "new writer sign up is successful" do
    get new_writer_registration_path
    assert_response :success
  end

  test "new writer sign in is successful" do
    get new_writer_session_path
    assert_response :success
  end
end
