class Spinach::Features::UserLogin < Spinach::FeatureSteps
  include GivenBackground
  step 'I fill in email with \'huaming.rao@gmail.com\'' do
    #fill_in("email", with: 'huaming.rao@gmail.com')
  end

  step 'fill in password with \'12345678\'' do
    pending 'step not implemented'
  end

  step 'I press button "login"' do
    pending 'step not implemented'
  end

  step 'I should redirect to my homepage' do
    pending 'step not implemented'
  end

  step 'I press button \'login\'' do
    pending 'step not implemented'
  end

  step 'I should be notified with \'密码错误，你还可以尝试4次\'' do
    pending 'step not implemented'
  end

  step 'I fill in email with \'noregistered@gmail.com\'' do
    pending 'step not implemented'
  end

  step 'I should be notified with \'该用户不存在\'' do
    pending 'step not implemented'
  end

end
