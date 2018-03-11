require 'test_helper'
class StoryTest < ActiveSupport::TestCase
  test "doesn't create a story given 0 fields" do
    story = Story.new
    assert_not story.valid?, "Writer valid"
  end

  test "creates a writer when all fields provided" do
    writer = Writer.create(username: 'writer_test1', email: 'sample_email@fakedomain.com', password: 'sample_password')
    story = writer.stories.create(title: "The best title", description: "I don't know yet")
    assert story.valid?
    assert story.save
    assert Story.count == 1
    assert Story.first.writer.username == writer.username
  end
end
