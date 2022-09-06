FactoryBot.define do 
	
	factory :task do 
			id { 1 }
			title { 'cleaning' }
			content { 'cleaning the room' }
			deadline { '2022-08-15' }
			status { '完了' }
			priority { '中' }
			association :user

	factory :second_task, class: Task do
		id { 2 }
		title { 'laundry' }
		content { 'do laundry' }
		deadline { '2022-08-18'}
		status { '未着手' }
		priority { '高' }
		association :user

	after(:build) do |task| 
		label = create(:label)
		task.labellings << build(:labellings, task: task, label: label )
	end 
	end 
	end 
end
