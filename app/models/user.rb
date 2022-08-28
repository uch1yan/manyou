class User < ApplicationRecord
  has_many :tasks, dependent: :destroy
  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_validation { email.downcase! }
  has_secure_password
  validates :password, length: { minimum: 6 }
  before_destroy :do_not_destroy_last_admin 
  before_update :do_not_refuse_last_admin 


  private 

  def do_not_destroy_last_admin 
    if User.where(admin: :true).count <= 1 && self.admin
      throw(:abort)
    end 
  end 

  def do_not_refuse_last_admin 
    if User.where(admin: :true).count <= 1 && self.admin_change == [true, false] 
      errors.add :base, '管理者が1人以上必要です'
      throw(:abort)
    end 
  end 


end
