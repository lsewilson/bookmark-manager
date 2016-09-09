require 'spec_helper'

feature 'signing in' do

  let!(:user) do
    User.create(username: 'Santa' , email: 'santa@northpole.com',
                password: 'christmas', password_confirmation: 'christmas')
  end

  scenario 'user can sign in' do
    sign_in('santa@northpole.com','christmas')
    expect(page).to have_content('Welcome, Santa')
  end

  scenario 'user cannot sign in with wrong email' do
    sign_in('rudolph@northpole.com','christmas')
    expect(page).to have_content('The email or password is incorrect')
  end

  scenario 'user cannot sign in with wrong password' do
    sign_in('santa@northpole.com', 'reindeer' )
    expect(page).to have_content('The email or password is incorrect')
  end
end
