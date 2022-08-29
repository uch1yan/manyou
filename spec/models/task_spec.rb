require 'rails_helper'

describe 'タスクモデル機能', type: :model do 

  describe 'バリデーションのテスト' do 
    context 'タスクのタイトルが空の場合' do 
      it 'is invalid without a title' do 
        task = Task.new(title:'', content:'clean the room')
        expect(task).not_to be_valid 
      end
    end 

    context 'タスクの詳細が空の場合' do 
      it 'is invalid without a content' do 
        task = Task.new(title: 'cleaning', content: '')
        expect(task).not_to be_valid 
      end 
    end 

    context 'タスクのタイトル、詳細、締め切り、優先順位、状態の内容が記載されている場合' do 
      it 'is valid with a title, content, deadline, priority and status' do 
        task = Task.new(title: 'cleaning', content: 'clean the room', deadline: '2022-08-30', priority: '中', status: '完了')
        expect(task).to be_valid
      end 
    end 
  end 

  describe '検索機能' do 
    let!(:task) { FactoryBot.create(:task, title: 'cleaning')}
    let!(:second_task) { FactoryBot.create(:second_task, title: 'laundry')}
    context 'scopeメソッドでタイトルのあいまい検索をした場合' do 
      it '検索キーワードを含むタスクが絞り込まれる' do 
        expect(Task.search_title('cleaning')).to include(task)
        expect(Task.search_title('cleaning')).not_to include(second_task)
        expect(Task.search_title('cleaning').count).to eq 1 
      end 
    end 

    context 'scopeメソッドでステータス検索をした場合' do 
      it 'ステータスに完全一致するタスクが絞り込まれる' do 
        expect(Task.search_status('完了')).to include(task)
      end 
    end 

    context 'scopeメソッドでタイトルのあいまい検索とステータス検索をした場合' do 
      it '検索キーワードをタイトルに含み、かつステータスに完全一致するタスク絞り込まれる' do 
        expect(Task.title_status('cleaning', '完了')).to include(task)
      end 
    end 
  end 
end