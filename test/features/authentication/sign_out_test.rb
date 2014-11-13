require 'test_helper'

feature 'As a site visitor, if I\'m signed in, I want to be able to sign out
  of my account using a sign out button,
  so that my user account doesn\'t get abused by geeks.' do
  scenario 'sign out' do
    # Given I'm logged into my account
    visit root_path
    click_on 'Sign In'
    fill_in 'Email', with: 'tester@user.com'
    fill_in 'Password', with: 'password'
    click_on 'Log In'

    # When I sign out of my account
    click_on 'Sign Out'

    # Then my user session object is destroyed
    page.must_have_content 'Signed out successfully'
    page.must_have_content 'Sign In'
    page.wont_have_content 'Sign Out'
  end
end
