require 'spec_helper'



describe "before logging in" do


  it "does NOT display the logout button when user has not logged in" do
    visit '/'
    page.should_not have_selector('navbar_logout')
  end

  it "displays the signin button when user has not logged in" do
    visit '/'
    page.should have_button('signin')
  end

end

describe 'after logging in' do
  before(:each) do 
    User.create!(username:'jimmy', password:'jimmy',email:'jimmy')
    visit '/'
    fill_in('username', :with => 'jimmy')
    fill_in('password', :with => 'jimmy')
    click_on('signin')
  end


  it "displays the logout button when user has logged in" do
      page.should have_button('logout')
  end

it "displays the signin button after logging out" do
    click_on('logout')
    page.should have_button('signin')
  end
end

