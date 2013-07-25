require 'spec_helper'

feature "Viewing responses" do
  before do
    textmate_2 = Factory(:discussion, :question => "TextMate 2")
    Factory(:response,
            :discussion => textmate_2,
            :answer => "Make it shiny!")
    internet_explorer = Factory(:discussion, :question => "Internet Explorer")
    Factory(:response,
            :discussion => internet_explorer,
            :answer => "Standards compliance")
    visit '/' end

  scenario "Viewing responses for a given discussion" do
    click_link "TextMate 2"
    page.should have_content("Make it shiny!")
    page.should_not have_content("Standards compliance")
    click_link "Make it shiny!"
    within("#response p") do
      page.should have_content("Make it shiny!")
    end
  end
end
