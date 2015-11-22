module ControllerHelpers
  def login_with(user = double('user'), scope = :user)
    current_user = "current_#{scope}".to_sym
    if user.nil?
      allow(request.env['warden']).to receive(:authenticate!).and_throw(:warden, {:scope => scope})
      allow(controller).to receive(current_user).and_return(nil)
    else
      allow(request.env['warden']).to receive(:authenticate!).and_return(user)
      allow(controller).to receive(current_user).and_return(user)
    end
  end

  def login_admin(email="admin@test.com")
    create(:user,
           email: email,
           password: '12345678',
           password_confirmation: '12345678',
           superadmin: true)

    visit root_path
    fill_in 'user_email', with: 'doej@test.com'
    fill_in 'user_password', with: '12345678'
    click_button 'Log in'
  end
end