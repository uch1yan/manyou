class User < ApplicationRecord
  has_many :tasks, dependent: :destroy, foreign_key: :task_user_id
end
