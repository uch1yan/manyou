FactoryBot.define do 
	
	factory :task do 
			title { 'cleaning' }
			content { 'cleaning the room' }
			deadline { '2022-08-15'}
	end

	factory :second_task, class: Task do
		title { 'laundry' }
		content { 'do laundry' }
		deadline { '2022-08-18'}
	end
end 