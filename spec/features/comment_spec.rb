require 'rails_helper'

feature 'comment', type: :feature do
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
  scenario 'post_and_edit_and_destroy' do
    # コメントをする
    expect do
      visit content_path(Content.first)
      fill_in 'comment_text', with: 'test_comment'
      first('input[name="commit"]').click
    end.to change(Comment, :count).by(1)
    # コメントを編集する
    visit content_path(Content.first)
    first('a[class="edit_commment_button"]').click
    fill_in 'comment_text', with: 'fixed_comment'
    first('input[name="commit"]').click
    expect(page).to have_content('fixed_comment')
    # コメントを削除する
    expect do
      visit content_path(Content.first)
      first('a[class="destroy_commment_button"]').click
    end.to change(Comment, :count).by(-1)
  end
end
