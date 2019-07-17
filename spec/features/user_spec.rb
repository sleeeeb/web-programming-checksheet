require 'rails_helper'

feature 'user', type: :feature do
  let(:user) { create(:user) }

  scenario 'login' do
    visit root_path
    # ログイン前には投稿ボタンがない
    expect(page).to have_no_content('ログアウト')
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    first('input[name="commit"]').click
    expect(current_path).to eq root_path
    expect(page).to have_content('ログアウト')
  end
end
