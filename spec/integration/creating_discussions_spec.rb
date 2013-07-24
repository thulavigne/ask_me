require 'spec_helper'

feature 'Creating Discussions' do
  scenario "can create a discussion" do
    visit '/'
    click_link 'New Discussion'
    fill_in 'Question', :with => 'TextMate 2'
    click_button 'Create Discussion'
    page.should have_content('Discussion has been created.')
  end
end
