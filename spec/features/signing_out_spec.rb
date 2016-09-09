require 'spec_helper'

feature 'signing in' do

  let!(:user) do
    User.create(username: 'Santa' , email: 'santa@northpole.com',
                password: '123456', password_confirmation: '123456')
  end

  scenario 'user can sign out' do
    visit '/sessions/new'
    fill_in('email', with: 'santa@northpole.com')
    fill_in('password', with: '123456')
    click_button 'Sign in'
    click_button 'Sign out'
    expect(page).to have_content('Goodbye, Santa')
  end
end
