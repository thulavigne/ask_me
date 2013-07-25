require 'spec_helper'

feature "Creating Responses" do
    before do
      Factory(:discussion, :question => "Internet Explorer")
      user = Factory(:user, :email => "ticketee@example.com")
      user.confirm!
      visit '/'
      click_link "Internet Explorer"
      click_link "New Answer"
      message = "You need to sign in or sign up before continuing."
      page.should have_content(message)
      fill_in "Email", :with => "ticketee@example.com"
      fill_in "Password", :with => "password"
      click_button "Sign in"
      within("h2") { page.should have_content("New Answer") }
    end

  scenario "Creating a response" do
    fill_in "Answer", :with => "Non-standards compliance"
    click_button "Create Response"
    page.should have_content("Answer has been submitted.")
    within("#response #author") do
      page.should have_content("Created by ticketee@example.com")
    end
  end

  scenario "Creating a response without valid attributes fails" do
    click_button "Create Response"
    page.should have_content("Answer has not been submitted.")
    page.should have_content("Answer can't be blank")
  end
end
