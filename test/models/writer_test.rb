require 'test_helper'

class WriterTest < ActiveSupport::TestCase

  test "doesn't create a writer given 0 fields" do
    writer = Writer.new
    assert_not writer.valid?, "Writer valid"
  end

  test "creates a writer when all fields provided" do
    writer = Writer.new(username: 'writer_test1', email: 'sample_email@fakedomain.com', password: 'sample_password')
    assert writer.valid?
    assert writer.save
  end

  test "does not create a new user when username already exists" do
    writer = Writer.new(username: 'writer_test1', email: 'sample_email@fakedomain.com', password: 'sample_password')
    writer.save
    duplicated_writer = Writer.new(username: 'writer_test1', email: 'sample_email@fakedomain.com', password: 'sample_password')
    assert_not duplicated_writer.valid?
  end
end
