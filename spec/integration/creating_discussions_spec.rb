require 'spec_helper'

feature 'Creating Discussions' do
  scenario "can create a discussion" do
    visit '/'
    click_link 'New Discussion'
    fill_in 'Question', :with => 'TextMate 2'
    click_button 'Create Discussion'
    page.should have_content('Discussion has been created.')
    discussion = Discussion.find_by_question("TextMate 2")
    page.current_url.should == discussion_url(discussion)
    title = "TextMate 2 - Discussions - Ask Me"
    find("title").should have_content(title)
  end
end
