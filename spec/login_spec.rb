describe('Login') do

  before do
    visit '/login'
  end

  it('quando o usuário informa uma senha inválida') do
    fill_in 'username', with: 'eu@papito.io'
    fill_in 'password', with: 'xpto123'
    click_button 'Login'

    expect(page).to have_content 'Incorrect password'
  end

  it('quando o usuário não~está cadastrado') do
    fill_in 'username', with: 'asdasdasd@asdasd.io'
    fill_in 'password', with: 'xpto123'
    click_button 'Login'

    expect(page).to have_content 'User not found'
  end

  after(:each) do |e|
    temp_screenshot='/log/reports/temp_screenshot.png'
    new_screenshot=File.new(page.save_screenshot(File.join(Dir.pwd, temp_screenshot)))
    e.attach_file('screenshot', new_screenshot)
  end
end