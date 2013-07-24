require 'spec_helper'
feature "Deleting discussions" do
  scenario "Deleting a discussion" do
    Factory(:discussion, :question => "TextMate 2")
    visit "/"
    click_link "TextMate 2"
    click_link "Delete Discussion"
    page.should have_content("Discussion has been deleted.")
    visit "/"
    page.should_not have_content("TextMate 2")
  end
end
