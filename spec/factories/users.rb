FactoryBot.define do 
	
	factory :user do 
			id { 10 }
			name { 'test' }
			email { 'test@gmail.com' }
			password { '000000' }
			password_confirmation { '000000' }
			admin { false }
	end

	factory :admin, class: User do 
			id { 11 }
			name { 'test_admin' }
			email { 'admin@gmail.com' }
			password { '000000' }
			password_confirmation { '000000' }
			admin { true }
	end
end 