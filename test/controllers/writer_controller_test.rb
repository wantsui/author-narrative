require 'test_helper'
require 'byebug'

class WriterControllerTest < ActionDispatch::IntegrationTest
  setup do
    writers(:default_writer)
    stories(:default_writer_stories)
  end

  test "index" do
    get writers_path
    assert_response :success
  end
end
