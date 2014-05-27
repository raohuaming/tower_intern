module GivenBackground
  include Spinach::DSL

  step 'an existing user \'huaming\' with email \'huaming.rao@gmail.com\' and password \'12345678\'' do
    user = User.new
    user.name = 'huaming'
    user.email = 'huaming.rao@gmail.com'
    user.password = '12345678'
    expect(user.save).to be_true
  end
end

