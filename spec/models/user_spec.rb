require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe 'ユーザー新規登録' do  
    #context '新規登録ができる場合' do
      #it "全ての項目に入力できている" do
        #expect(@user).to be_valid
      #end

     #it 'passwordが６文字以上の半角英数字混合であれば登録できる'  do  
        #@user.password = "000aaa"
       # @user.password_confirmation = "000aaa"
        #expect(@user).to be_valid
        
      #end 
    #end   
    #null: false、presence: true のテスト
    context '新規登録ができない場合'
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

      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        
        expect(another_user.errors.full_messages).to include "Email has already been taken"
      end  

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end
      
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end

      
    end
  end

