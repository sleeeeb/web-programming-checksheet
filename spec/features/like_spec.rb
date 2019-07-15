require 'rails_helper'

feature 'like', type: :feature do
  let(:user) { create(:user) }
  before do
    create(:genre)
    create(:content)
    # ユーザーログイン
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    first('input[name="commit"]').click
    # コメントの作成
    visit content_path(Content.first)
    fill_in 'comment_text', with: 'test'
    first('input[name="commit"]').click
  end
  scenario 'post_and_destroy' do
    expect do
      visit content_path(Content.first)
      first('a[class="likebutton"]').click
    end.to change(Like, :count).by(1)
    expect do
      visit content_path(Content.first)
      first('a[class="dislikebutton"]').click
    end.to change(Like, :count).by(-1)
  end
end
