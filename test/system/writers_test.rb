require "application_system_test_case"
require 'byebug'

class WritersTest < ApplicationSystemTestCase

  setup do
    writer = Writer.create!(username: 'writer_test_1', password: ENV['seed_file_writer_default_password'], bio: "This is a writer created as part of a test.", email: ENV['seed_file_writer_default_email'])
    writer.stories.create!(title: 'The Programmer and the Rock Dove', description: 'A young rock dove decides to program.', share_work: true)
  end

  test "a writer can sign up with a new account" do
    visit('/')
    click_on "Sign Up"
    fill_in "Email", with: "sample_email@sample_email.com"
    fill_in "Username", with: "username1"
    fill_in "Password", with: "sample_password"
    fill_in "Password confirmation", with: "sample_password"
    click_on "Sign up"

    assert page.status_code == 200
    assert page.title == "Author Narrative"
    assert Writer.last.username == 'username1'
    assert Writer.count == 2
  end

  test "a writer cannot sign up if password is missing" do
    visit('/')
    click_on "Sign Up"
    fill_in "Email", with: "sample_email@sample_email.com"
    fill_in "Username", with: "username1"
    click_on "Sign up"

    assert page.text.include?("1 error prohibited this writer from being saved: Password can't be blank")
    assert Writer.count == 1
  end

  test "a writer log in with the correct credentials" do
    visit('/')
    click_on "Sign In"
    fill_in "Email", with: ENV['seed_file_writer_default_email']
    fill_in "Password", with: ENV['seed_file_writer_default_password']
    click_on "Log in"

    assert page.status_code == 200
    assert page.title == "Author Narrative"
  end

  test "a writer cannot log in with the correct credentials" do
    visit('/')
    click_on "Sign In"
    fill_in "Email", with: ENV['seed_file_writer_default_email']
    fill_in "Password", with: 'random'
    click_on "Log in"

    assert page.status_code == 200
    assert page.current_url.include?("writers/sign_in")
  end

end
