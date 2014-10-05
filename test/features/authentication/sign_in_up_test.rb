require 'test_helper'

feature 'As a site visitor, I want to be able to sign up for an account,
  so that I can do things that require me to be logged in.' do
  scenario 'sign up' do
    # Given a sign up form
    visit '/'
    click_on 'Sign Up'

    # When I sign up with valid info
    fill_in 'Email', with: 'tester@user.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_on 'Sign up'

    # Then I should be signed up
    page.must_have_content 'You have signed up successfully'
    page.wont_have_content 'There was a problem with your sign up'
  end

  scenario 'sign in' do
    # Given a sign in form
    visit '/'
    click_on 'Sign In'

    # When I sign in with valid info
    fill_in 'Email', with: 'tester2@user.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_on 'Sign up'

    # Then I should be signed in to the site
    page.must_have_content 'You have signed in successfully'
    page.wont_have_content 'There was a problem with your sign in'
  end
end
