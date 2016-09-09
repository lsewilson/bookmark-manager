require 'spec_helper'

feature 'signing in' do

  let!(:user) do
    User.create(username: 'Santa' , email: 'santa@northpole.com',
                password: '123456', password_confirmation: '123456')
  end

  scenario 'user can sign in' do
    visit '/sessions/new'
    fill_in('email', with: 'santa@northpole.com')
    fill_in('password', with: '123456')
    click_button 'Sign in'
    expect(page).to have_content('Welcome, Santa')
  end

  scenario 'user cannot sign in with wrong email' do
    visit '/sessions/new'
    fill_in('email', with: 'rudolph@northpole.com')
    fill_in('password', with: '123456')
    click_button 'Sign in'
    expect(page).to have_content('The email or password is incorrect')
  end

  scenario 'user cannot sign in with wrong password' do
    visit '/sessions/new'
    fill_in('email', with: 'santa@northpole.com')
    fill_in('password', with: 'santa')
    click_button 'Sign in'
    expect(page).to have_content('The email or password is incorrect')
  end
end
