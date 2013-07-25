require 'spec_helper'

feature "Editing responses" do
  let!(:discussion) { Factory(:discussion) }
  let!(:response) { Factory(:response, :discussion => discussion) }
  before do
    visit '/'
    click_link discussion.question
    click_link response.answer
    click_link "Edit Answer"
  end

  scenario "Updating a response" do
    fill_in "Answer", :with => "Make it really shiny!"
    click_button "Update Response"
    page.should have_content "Answer has been updated."
    within("#response p") do
      page.should have_content("Make it really shiny!")
    end
    page.should_not have_content response.answer
  end

  scenario "Updating a response with invalid information" do
    fill_in "Answer", :with => ""
    click_button "Update Response"
    page.should have_content("Answer has not been updated.")
  end
end
