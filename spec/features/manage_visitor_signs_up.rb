require 'rails_helper'

feature 'Manage Visitor Signup' do
  before(:each) { login_admin('doej@test.com') }

  scenario '#manages visitor signup',:js => true do

    visit visitors_path
    fill_in 'First Name', with: 'ram'
    fill_in 'Last Name', with: 'prabhu'
    select 'Male', from: 'Sex'
    fill_in 'Age', with: 22
    fill_in 'PhoneNo', with: '9600804251'
    fill_in 'Location', with: 'Chennai'
    fill_in 'Reason for Visit', with: 'Interview'
    fill_in 'Contact Person', with: 'HR'
    select 'PANCard', from: 'ID Proof'
    fill_in 'ID Number', with: 'BADPR2605A'
    find('input[type="submit"]').click
    #page.driver.browser.switch_to.alert.accept
    expect(page).to have_content('ram prabhu').and have_content('Male').and have_content('22').and have_content('9600804251').and have_content('Chennai').and have_content('Interview').and have_content('HR').and have_content('BADPR2605A')

    click_on "Edit"
    fill_in 'First Name', with: 'mahesh'
    fill_in 'Last Name', with: 'pandiyan'
    select 'Male', from: 'Sex'
    fill_in 'Age', with: 22
    fill_in 'PhoneNo', with: '85780023658'
    fill_in 'Location', with: 'Chennai'
    fill_in 'Reason for Visit', with: 'Interview'
    fill_in 'Contact Person', with: 'HR'
    select 'PANCard', from: 'ID Proof'
    fill_in 'ID Number', with: 'BADPR2605A'
    find('input[type="submit"]').click
    #page.driver.browser.switch_to.alert.accept
    expect(page).to have_content('mahesh pandiyan').and have_content('Male')
    expect(page).not_to have_content('ram prabhu')

  end
end

feature 'User signs up' do
  before(:each) { login_admin('doej@test.com') }

  scenario 'with valid email and password' do
    sign_up_with 'valid@example.com', 'password'

    expect(page).to have_content('Logout')
  end

  scenario 'with invalid email' do
    sign_up_with 'invalid_email', 'password'

    expect(page).to have_content('is invalid')
  end

  scenario 'with blank password' do
    sign_up_with 'valid@example.com', ''

    expect(page).to have_content("can't be blank")
  end

  def sign_up_with(email, password)
    visit admin_users_path
    click_on 'New User'
    fill_in 'user_email', with: email
    fill_in 'user_password', with: password
    fill_in 'user_password_confirmation', with: password
    click_button 'Save'
  end
end



