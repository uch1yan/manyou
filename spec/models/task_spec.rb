require 'rails_helper'
describe 'タスクモデル機能', type: :model do 
  describe 'バリデーションのテスト' do 
    context 'タスクのタイトルが空の場合' do 
      it 'is invalid without a title' do 
        task = Task.new(title:'', content:'do laundry')
        expect(task).not_to be_valid 
      end
    end 

    context 'タスクの詳細が空の場合' do 
      it 'is invalid without a content' do 
        task = Task.new(title: 'laundry', content: '')
        expect(task).not_to be_valid 
      end 
    end 

    context 'タスクのタイトルと詳細に内容が記載されている場合' do 
      it 'is valid with a title and content' do 
        task = Task.new(title: 'laundry', content: 'do laundry!')
        expect(task).to be_valid 
      end 
    end 
  end 
end 