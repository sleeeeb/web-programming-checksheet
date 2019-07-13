require 'rails_helper'

describe User do
  describe '#create' do
    # nickname,email,passwordがあればOK
    it 'is valid with a nickname,email,password' do
      user = build(:user)
      expect(user).to be_valid
    end

    # emailなしではだめ
    it 'is invalid without a email' do
      user = build(:user, email: ' ')
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    # usernameなしではだめ
    it 'is invalid without a nickname' do
      user = build(:user, username: ' ')
      user.valid?
      expect(user.errors[:username]).to include("を入力してください")
    end

    # passwordなしではだめ
    it 'is invalid without a password' do
      user = build(:user, password: ' ')
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    # passwordがあってもpassword_confirmationがないとだめ
    it 'is invalid without a password_confirmation if password exist' do
      user = build(:user, password_confirmation: ' ')
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とPasswordの入力が一致しません")
    end

    # emailかぶっちゃだめ
    it 'is invalid with duplicate email' do
      create(:user)
      another_user = build(:user)
      another_user.valid?
      expect(another_user.errors[:email]).to include('はすでに存在します')
    end

    # パスワード６文字以上ならOK
    it 'is valid with password over 6 letters' do
      user = build(:user, password: 'hoge00', password_confirmation: 'hoge00')
      expect(user).to be_valid
    end

    # パスワード５文字以下だとだめ
    it 'is invalid with password less than 5 letters' do
      user = build(:user, password: 'hoge0', password_confirmation: 'hoge0')
      user.valid?
      expect(user.errors[:password][0]).to include('は6文字以上で入力してください')
    end
  end
end
