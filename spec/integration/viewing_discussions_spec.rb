require 'spec_helper'

feature "Viewing discussions" do
  scenario "Listing all discussions" do
    discussion = Factory.create(:discussion, :question => "TextMate 2")
    visit '/'
    click_link 'TextMate 2'
    page.current_url.should == discussion_url(discussion)
  end
end
