require_relative './helpers/sign_in.rb'

feature "Existing user can log into Chitter" do

  include SignIn

  before(:each) do
    User.create(:email => "mrTex@test.com",
                 :password => 'TedTex',
                 :password_confirmation => 'TedTex')
  end

  scenario 'after new user creation user is not signed in' do
    visit '/'
    expect(page).not_to have_content('Welcome mrTex@test.com')
  end

  scenario 'with correct credentials' do
    sign_in('mrTex@test.com', 'TedTex')
    expect(page).to have_content('Welcome, mrTex@test.com')
  end

  scenario 'with the wrong credentials' do
    sign_in("mrTex@test.com", "wrongOne")
    expect(page).not_to have_content('Welcome mrTex@test.com')
  end



end