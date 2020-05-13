require 'rails_helper'
describe Message, type: :model do
  describe '#create' do
    context 'messageを保存できる場合' do

      it "contentがあれば保存できること" do
        message = build(:message, image: nil)
        expect(message).to be_valid
      end

      it "imageがあれば保存できること" do
        message = build(:message, content: nil)
        expect(message).to be_valid
      end

      it "content と image があれば保存できること" do
        message = build(:message)
        expect(message).to be_valid
      end

    end

    context 'messageを保存できない場合' do

      it "content と image が両方空だと保存できないこと" do
        message = build(:message, content: nil, image: nil)
        message.valid?
        expect(message.errors[:content]).to include("を入力してください")
      end

      it "group_idが無いと保存できないこと" do
        message = build(:message, group_id: nil)
        message.valid?
        expect(message.errors[:group]).to include("を入力してください")
      end

      it "user_idが無いと保存できないこと" do
        message = build(:message, user_id: nil)
        message.valid?
        expect(message.errors[:user]).to include("を入力してください")
      end

    end

    # it "nickname、email、passwordとpassword_confirmationが存在すれば登録できること" do
    #   user = build(:user)
    #   expect(user).to be_valid
    # end

    # it "nicknameがない場合は登録できないこと" do
    #   user = build(:user, nickname: "")
    #   user.valid?
    #   expect(user.errors[:nickname]).to include("can't be blank")
    # end

    # it "emailがない場合は登録できないこと" do
    #   user = build(:user, email: "")
    #   user.valid?
    #   expect(user.errors[:email]).to include("can't be blank")
    # end

    # it "passwordがない場合は登録できないこと" do
    #   user = build(:user, password: "")
    #   user.valid?
    #   expect(user.errors[:password]).to include("can't be blank")
    # end

    # it "passwordが存在してもpassword_confirmationがない場合は登録できないこと" do
    #   user = build(:user, password_confirmation: "")
    #   user.valid?
    #   expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    # end

    # it "nicknameが7文字以上であれば登録できないこと" do
    #   user = build(:user, nickname: "0000000")
    #   user.valid?
    #   expect(user.errors[:nickname]).to include("is too long (maximum is 6 characters)")
    # end

    # it "nicknameが6文字以下では登録できること" do
    #   user = build(:user, nickname: "000000")
    #   expect(user).to be_valid
    # end

    # it "重複したemailが存在する場合登録できないこと" do
    #   #はじめにユーザーを登録
    #   user = create(:user)
    #   #先に登録したユーザーと同じemailの値を持つユーザーのインスタンスを作成
    #   another_user = build(:user)
    #   another_user.valid?
    #   expect(another_user.errors[:email]).to include("has already been taken")
    # end

    # it "passwordが6文字以上であれば登録できること" do
    #   user = build(:user, password: "000000" ,password_confirmation: "000000")

    #   expect(user).to be_valid
    # end
    
    # it "passwordが5文字以下であれば登録できないこと
    # " do
    #   user = build(:user, password: "00000", password_confirmation: "00000")
    #   user.valid?
    #   expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
    # end




  end
end