# spec/support/wait_for_ajax.rb
module Login
  def login
    visit '/users/sign_in'
    fill_in 'Email', with: 'benhur.onrails@gmail.com'
    fill_in 'Password', with: 'numero04'
    page.first('#login_button').click
  end

end

RSpec.configure do |config|
  config.include Login, type: :feature
end