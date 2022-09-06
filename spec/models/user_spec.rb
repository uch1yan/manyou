require 'rails_helper'

describe 'step4', type: :model do 
  describe 'ユーザー登録' do
    let!(:user) { FactoryBot.create(:user) }
    let!(:user2) { FactoryBot.create(:admin) }
    it 'ユーザーの新規登録ができること' do 
      visit new_session_path 
    end 
  end 
end 