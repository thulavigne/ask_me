require 'spec_helper'

feature "Creating Responses" do
    before do
    Factory(:discussion, :question => "Internet Explorer")
    visit '/'
    click_link "Internet Explorer"
    click_link "New Answer"
  end

  scenario "Creating a response" do
    fill_in "Answer", :with => "Non-standards compliance"
    click_button "Create Response"
    page.should have_content("Answer has been submitted.")
  end

  scenario "Creating a response without valid attributes fails" do
    click_button "Create Response"
    page.should have_content("Answer has not been submitted.")
    page.should have_content("Answer can't be blank")
  end
end
