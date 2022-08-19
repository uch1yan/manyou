require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
  let!(:task) { FactoryBot.create(:task) }
  before do 
    visit tasks_path 
  end 

  describe '新規作成機能' do
    context 'タスクを新規作成した場合' do
	    it '作成したタスクが表示される' do
				visit new_task_path
				fill_in 'task_title', with: 'cleaning'
				fill_in 'task_content', with: 'clean the room'
        fill_in 'task_deadline', with: '2022-08-15'
				click_on '登録'
				expect(page).to have_content 'cleaning'
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
        FactoryBot.create(:task, title: 'cleaning', content: 'clean the room')
        FactoryBot.create(:task, title: 'laundry', content: 'do laundry')
        visit tasks_path 
        task_list = all('.task_row') 
        expect(task_list[0]).to have_content 'laundry'
        expect(task_list[1]).to have_content 'cleaning'
      end 
    end

    context '終了期限でソートするというリンクを押した場合' do
      it '終了期限の降順に並び替えられたタスク一覧が表示される' do
        FactoryBot.create(:task, title: 'cleaning', content: 'clean the room', deadline: '2022-08-15')
        FactoryBot.create(:task, title: 'laundry', content: 'do laundry', deadline: '2022-08-18')
        visit tasks_path 
        click_link '終了期限でソートする'
        sleep(2)
        task_list = all('.task_row') 
        expect(task_list[0]).to have_content '2022-08-18'
        expect(task_list[1]).to have_content '2022-08-15'
      end 
    end 
  end

  describe '詳細表示機能' do
    context '任意のタスク詳細画面に遷移した場合' do
	    it '該当タスクの内容が表示される' do
				@task = FactoryBot.create(:task, content: 'clean the room')
				visit task_path(@task)
				expect(page).to have_content('clean the room')
      end
    end
  end

    
end