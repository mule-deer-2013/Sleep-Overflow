module CapybaraHelpers
  def login user
    visit root_path
    fill_in "Username", :with => user.username
    fill_in "Password", :with => "password"
    click_button "signin"
  end
end
