require 'spec_helper'

feature 'profile page'  do
  it "displays the users answers" do
    visit '/'
    click_button 'my profile page'
  end
end

