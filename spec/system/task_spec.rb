require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
  let!(:task) { FactoryBot.create(:task, title: 'task') }
  before do 
    visit tasks_path 
  end 

  describe '新規作成機能' do
    context 'タスクを新規作成した場合' do
	    it '作成したタスクが表示される' do
				visit new_task_path
				fill_in 'task[title]', with: 'laundry'
				fill_in 'task[content]', with: '洗濯をする'
				click_on '登録'
				expect(page).to have_content 'laundry'
      end
    end
  end
  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みのタスク一覧が表示される' do
				expect(page).to have_content 'task'
      end
    end

    context 'タスクが作成日時の降順に並んでいる場合' do 
      it '新しいタスクが一番上に表示される' do
        assert Task.all.order(created_at: "desc")
      end 
    end
  end

  describe '詳細表示機能' do
    context '任意のタスク詳細画面に遷移した場合' do
	    it '該当タスクの内容が表示される' do
				@task = FactoryBot.create(:task, content: '洗濯をする')
				visit task_path(@task)
				expect(page).to have_content('洗濯をする')
      end
    end
  end
end