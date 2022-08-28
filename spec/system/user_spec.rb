require 'rails_helper'
RSpec.describe 'ユーザー管理機能', type: :system do
  let!(:user) { FactoryBot.create(:user) }
  let!(:user2) { FactoryBot.create(:admin) }
  
  describe 'ユーザ登録' do
    context 'ユーザーを新規作成した場合' do
      it '登録ができる' do
        visit new_user_path
				fill_in 'user_name', with: 'test_san'
				fill_in 'user_email', with: 'hello@gmail.com'
        fill_in 'user_password', with: '000000'
        fill_in 'user_password_confirmation', with: '000000'
				click_on 'Create my account'
				expect(page).to have_content 'test_san'
      end
    end 

    context 'ログインせずタスク一覧画面に飛ばした場合' do 
      it 'ログイン画面に移動する' do 
        visit new_session_path 
        visit tasks_path 
        visit current_path
      end 
    end 
  end         

  describe 'セッション機能のテスト' do 
    before do 
      visit new_session_path 
        fill_in 'session_email', with: 'test@gmail.com'
        fill_in 'session_password', with: '000000'
        click_on 'Log in'
    end 

    context 'ログインしたとき' do
      it 'ログインができること' do 
      expect(current_path).to eq user_path(id:10)
      end 

      it '自分の詳細画面（マイページ）に飛べること' do
        expect(page).to have_content  'test\'s page'
      end 

      it '一般ユーザーが他人の詳細画面に飛んだ場合タスク一覧画面に移動すること' do
        visit user_path(id:11)
        visit tasks_path
        expect(page).to have_content 'Task 一覧'
      end
    
      it 'ログアウトができること' do
        click_on 'Logout'
        expect(page).to have_content 'ログアウトしました' 
      end 
    end 
  end 

  describe '管理画面のテスト' do 
    before do 
      visit new_session_path
				fill_in 'session_email', with: 'admin@gmail.com'
        fill_in 'session_password', with: '000000'
				click_on 'Log in'
    end 

    context '管理ユーザーが管理画面にアクセスした場合' do
      it 'アクセスできること' do
        expect(page).to have_content 'test_admin\'s page'
      end 

      it 'ユーザの新規登録ができること' do
        visit new_admin_user_path
        fill_in 'user_name', with: 'user_test'
				fill_in 'user_email', with: 'user@gmail.com'
        fill_in 'user_password', with: '000000'
        fill_in 'user_password_confirmation', with: '000000'
				click_on 'Create an account'
				expect(page).to have_content 'user_test'
      end 

      it 'ユーザの詳細画面にアクセスできること' do
        visit admin_user_path(id:10)
        expect(page).to have_content 'test'
      end 

      it 'ユーザの編集画面からユーザを編集できること' do 
        visit edit_admin_user_path(id:10)
        fill_in 'user_name', with: 'user_test2'
				fill_in 'user_email', with: 'user2@gmail.com'
        fill_in 'user_password', with: '000000'
        fill_in 'user_password_confirmation', with: '000000'
				click_on 'Create an account'
				expect(page).to have_content 'User情報を更新しました!'
      end  

      it 'ユーザの削除をできること' do 
        visit admin_users_path
        click_on '削除', match: :first
        expect(page).to have_content 'Userを削除しました!'
      end 
    end 
  end 
end 












