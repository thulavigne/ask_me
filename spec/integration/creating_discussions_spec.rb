require 'spec_helper'

feature 'Creating Discussions' do
  before do
    visit '/'
    click_link 'New Discussion'
  end

  scenario "can create a discussion" do
    fill_in 'Question', :with => 'TextMate 2'
    click_button 'Create Discussion'
    page.should have_content('Discussion has been created.')
    discussion = Discussion.find_by_question("TextMate 2")
    page.current_url.should == discussion_url(discussion)
    title = "TextMate 2 - Discussions - Ask Me"
    find("title").should have_content(title)
  end

  scenario "can not create a project without a name" do
    click_button 'Create Discussion'
    page.should have_content("Discussion has not been created.")
    page.should have_content("Question can't be blank")
  end
end
