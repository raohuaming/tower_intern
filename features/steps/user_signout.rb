class Spinach::Features::UserSignout < Spinach::FeatureSteps
  include GivenBackground

  step 'I\'m now staying on homepage' do
    visit '/homepage'
  end

  step 'I press button \'signout\'' do
    click_link '退出'
  end

  step 'I should sign out and redirect to sign in page' do
    expect(current_path).to eq('/session/sign_in')
  end

  step 'has signined into tower.im' do
    visit '/session/sign_in'
    expect(page).to have_content("Tower")
    fill_in('email', with: 'huaming.rao@gmail.com')
    fill_in('password', with: '12345678')
    click_button '登录'
    expect(page).to have_content '登录成功'
  end
end
