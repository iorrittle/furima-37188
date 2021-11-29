require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe 'ユーザー新規登録' do  
    #context '新規登録が上手く行く時' do
      #it 'passwordが６文字以上の半角英数字混合であれば登録できる'  do  
        #@user.password = "000aaa"
        #@user.password_confirmation = "000aaa"
        #expect(@user).to be_valid
      #end  
    #null: false、presence: true のテスト

      it 'nickname:必須' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
    
      it 'email:必須' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end

      it 'passwaord:必須' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      
      it 'passwordが5文字以下だと登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end
        #email 一意性のテスト

      #it '重複したemailが存在する場合登録できない' do
        
        #@user.save
        #another_user = FactoryBot.build(:user, email: @user.email)
        #another_user.email = @user.email
        #another_user.valid?
        
        #expect(another_user.errors.full_messages).to include "Email has already been taken"
     #end  

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

    

    #it 'last_nameが空では登録できない'　do
      #@user.last_name = ''
      #@user.valid?
      #expect(@user.errors.full_messages).to include "Last_name can't be blank"
    #end
  
  end
end
