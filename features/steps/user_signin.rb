class Spinach::Features::UserSignin < Spinach::FeatureSteps
  include GivenBackground

  step 'I have accessed signin page' do
    visit '/session/sign_in'
    expect(page).to have_content("Tower")
  end

  step 'fill in email with \'huaming.rao@gmail.com\'' do
    fill_in('email', with: 'huaming.rao@gmail.com')
  end

  step 'fill in password with \'12345678\'' do
    fill_in('password', with: '12345678')
  end

  step 'fill in password with \'wrongpassword\'' do
    fill_in('password', with: 'wrongpassword')
  end

  step 'I press button "signin"' do
    click_button('登录')
  end

  step 'I should redirect to my homepage' do
    expect(page).to have_content '登录成功'
  end

  step 'I should be notified with \'密码错误\'' do
    expect(page).to have_content '密码错误'
  end

end
