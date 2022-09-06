require 'rails_helper'
RSpec.describe 'ラベル管理機能', type: :system do
  let!(:user) { FactoryBot.create(:user) }
  let!(:task) { FactoryBot.create(:task, user: user) }
  let!(:label) { FactoryBot.create(:label) }
  let!(:label2) { FactoryBot.create(:label2) }


  
  before do 
    visit new_session_path
		fill_in 'session_email', with: 'test@gmail.com'
    fill_in 'session_password', with: '000000'
		click_on 'Log in'
    visit tasks_path 
  end 

  describe 'ラベル管理' do
    before do 
      visit new_task_path
			fill_in 'task_title', with: 'cleaning'
			fill_in 'task_content', with: 'clean the room'
      fill_in 'task_deadline', with: '2022-08-25'
      select '未着手', from: 'task_status'
      check 'label_name'
      check 'label_name2'
			click_on '登録'
    end 

    context 'タスクを新規作成した場合' do
      it 'タスクと一緒にラベルも登録ができる' do
				expect(page).to have_content 'label_name'
      end

      it 'タスクに複数のラベルをつけられる' do 
				expect(page).to have_content 'label_name'
        expect(page).to have_content 'label_name2'
      end 
    end

    context 'タスク詳細画面にとんだ場合' do 
      it 'そのタスクに紐づいているラベル一覧も表示させる' do
        visit task_path(id:1)
        expect([label, label2]).to match_array([label, label2])
      end 
    end 

    context 'ラベル検索をした場合' do
      it '検索したラベルのみが表示される' do
        visit tasks_path 
        select 'label_name', from: 'label_id'
        expect(page).to have_content 'label_name'
      end
    end 
  end  
end 