require 'spec_helper'

feature 'user sign up' do

  scenario 'user information is saved to database' do
    user_signup
    click_button 'Sign Up!'
    user = User.first
    expect(user.username).to eq 'Santa'
    expect(user.email).to eq 'santa@northpole.com'
  end

  scenario 'user is welcomed once signed up' do
    user_signup
    expect{click_button 'Sign Up!'}.to change{User.count}.by(1)
    expect(page).to have_content('Welcome Santa!')
  end

  scenario 'validates user password' do
    user_signup
    fill_in 'password', with: 'hello'
    fill_in 'password_confirmation', with: 'he11o'
    expect{click_button 'Sign Up!'}.not_to change{User.count}
  end
end
