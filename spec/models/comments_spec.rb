require 'rails_helper'

describe Comment do
  describe '#create' do
    # アソシエーションの作成
    before do
      create(:genre)
      create(:user)
      create(:content)
    end
    # コメントがあればOK
    it 'is valid with comment' do
      comment = create(:comment)
      expect(comment).to be_valid
    end
    # コメントがないとエラー
    it 'is invalid without comment' do
      comment = build(:comment, text: '')
      comment.valid?
      expect(comment.errors[:text]).to include("を入力してください")
    end
  end
end
