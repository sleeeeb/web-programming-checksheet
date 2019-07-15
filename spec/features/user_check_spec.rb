require 'rails_helper'

feature 'user_check', type: :feature do
  let(:user) { create(:user) }
  before do
    create(:genre)
    create(:content)
    # ユーザーログイン
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    first('input[name="commit"]').click
  end
  scenario 'post' do
    expect do
      visit genre_path(Genre.first)
      find("input[value='3']").set(true)
      check
      first('input[name="commit"]').click
    end.to change(Check, :count).by(1)
  end
end
