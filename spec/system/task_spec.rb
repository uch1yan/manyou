require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
  let!(:user) { FactoryBot.create(:user) }
  let!(:task) { FactoryBot.create(:task, user: user) }
  
  before do 
    visit new_session_path
		fill_in 'session_email', with: 'test@gmail.com'
    fill_in 'session_password', with: '000000'
		click_on 'Log in'
    visit tasks_path 
  end 

  describe '新規作成機能' do
    context 'タスクを新規作成した場合' do
      it '作成したタスクが表示される' do
				visit new_task_path
				fill_in 'task_title', with: 'cleaning'
				fill_in 'task_content', with: 'clean the room'
        fill_in 'task_deadline', with: '2022-08-25'
        select '未着手', from: 'task_status'
				click_on '登録'
				expect(page).to have_content 'cleaning'
      end

      it 'ステータスが登録される' do
				visit new_task_path
				fill_in 'task_title', with: 'cleaning'
				fill_in 'task_content', with: 'clean the room'
        fill_in 'task_deadline', with: '2022-08-15'
        select '完了', from: 'task_status'
				click_on '登録'
				expect(page).to have_content '完了'
      end
    end
  end
  
  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みのタスク一覧が表示される' do
				expect(page).to have_content 'cleaning'
      end
    end

    context 'タスクが作成日時の降順に並んでいる場合' do 
      it '新しいタスクが一番上に表示される' do
        FactoryBot.create(:task, title: 'cleaning', content: 'clean the room', user: user)
        FactoryBot.create(:task, title: 'laundry', content: 'do laundry', user: user)
        visit tasks_path 
        task_list = all('.task_row') 
        expect(task_list[0]).to have_content 'laundry'
        expect(task_list[1]).to have_content 'cleaning'
      end 
    end

    context '終了期限でソートするというリンクを押した場合' do
      it '終了期限の降順に並び替えられたタスク一覧が表示される' do
        FactoryBot.create(:task, title: 'cleaning', content: 'clean the room', deadline: '2022-08-15', user: user)
        FactoryBot.create(:task, title: 'laundry', content: 'do laundry', deadline: '2022-08-18', user: user)
        visit tasks_path 
        click_link '終了期限でソートする'
        sleep(2)
        task_list = all('.task_row') 
        expect(task_list[0]).to have_content '2022-08-18'
        expect(task_list[1]).to have_content '2022-08-15'
      end 
    end 

    context '優先順位でソートするというリンクを押した場合' do 
      it '優先順位の高い順に並び替えられる' do 
        FactoryBot.create(:task, title: 'test1', content: 'wash dishes', priority: '中', user: user)
        FactoryBot.create(:task, title: 'test2', content: 'take a walk', priority: '高', user: user)
        visit tasks_path 
        click_link '優先順位でソートする'
        sleep(2)
        task_list = all('.task_row') 
        expect(task_list[0]).to have_content '高'
        expect(task_list[1]).to have_content '中'
      end 
    end
  end

  describe '詳細表示機能' do
    context '任意のタスク詳細画面に遷移した場合' do
      it '該当タスクの内容が表示される' do
				@task = FactoryBot.create(:task, content: 'clean the room', user: user)
				visit task_path(@task)
				expect(page).to have_content('clean the room')
      end
    end
  end

  describe '検索機能' do 
    before do 
        FactoryBot.create(:task, title: 'cleaning', user: user)
        FactoryBot.create(:second_task, title: 'laundry', user: user)
    end 

    context 'タイトルであいまい検索をした場合' do 
      it '検索キーワードを含むタスクで絞り込まれる' do 
        visit tasks_path 
        fill_in 'task_title', with: 'cleaning'
        click_on '検索'
        expect(page).to have_content 'cleaning'
      end 
    end 

    context 'ステータス検索をした場合' do 
      it 'ステータスに完全一致するタスクが絞り込まれる' do 
        visit tasks_path 
        select '完了', from: 'task_status'
        expect(page).to have_content '完了'
      end   
    end

    context 'タイトルのあいまい検索とステータス検索をした場合' do 
      it '検索キーワードをタイトルに含み、かつステータスに完全一致するタスクに絞りこまれる' do 
        visit tasks_path 
        fill_in 'task_title', with: 'cleaning'
        select '完了', from: 'task_status'
        click_on '検索'
        expect(page).to have_content 'cleaning'
        expect(page).to have_content '完了'
      end 
    end
  end  
end