require 'spec_helper'
  feature "Editing Discussions" do
    before do
      Factory(:discussion, :question => "TextMate 2")
      visit '/'
      click_link "TextMate 2"
      click_link "Edit Question"
    end

    scenario "Updating a discussion" do
      fill_in "Question", :with => "TextMate 2 beta"
      click_button "Update Discussion"
      page.should have_content("Discussion has been updated.")
    end

    scenario "Updating a discussion with invalid attributes is bad" do
      fill_in "Question", :with => ""
      click_button "Update Discussion"
      page.should have_content("Discussion has not been updated.")
    end
end
