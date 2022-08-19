FactoryBot.define do 
	
	factory :task do 
			title { 'cleaning' }
			content { 'cleaning the room' }
			deadline { '2022-08-15' }
			status { '完了' }
			priority { '中' }
	end

	factory :second_task, class: Task do
		title { 'laundry' }
		content { 'do laundry' }
		deadline { '2022-08-18'}
		status { '未着手' }
		priority { '高' }
	end
end 