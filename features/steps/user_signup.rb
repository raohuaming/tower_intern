class Spinach::Features::UserSignup < Spinach::FeatureSteps
  include GivenBackground

  step 'I have accessed signup page' do
    visit new_user_path
    expect(page).to have_content("Tower")
  end

  step 'fill in name with \'sam\'' do
    fill_in('name', with: 'sam')
  end

  step 'fill in email with \'sam@test.com\'' do
    fill_in('email', with: 'sam@test.com')
  end

  step 'fill in password with \'12345678\'' do
    fill_in('password', with: '12345678')
  end

  step 'I press button \'signup\'' do
    click_button '注册'
  end

  step 'I should successfully register a new account' do
    expect(page).to have_content('注册成功')
    user = User.find_by_email('sam@test.com')
    expect(user.name).to eq('sam')
  end

  step 'fill in name with \'huaming\'' do
    fill_in('name', with: 'huaming')
  end

  step 'fill in email with \'huaming.rao@gmail.com\'' do
    fill_in('email', with: 'huaming.rao@gmail.com')
  end

  step 'I should be notified with \'该账号已存在，请直接登录后创建新团队\'' do
    expect(page).to have_content '该账号已存在，请直接登录后创建新团队'
  end

end
