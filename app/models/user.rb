class User < ActiveRecord::Base

  has_many :upvotes
  has_many :tracks

  validates :email, :first_name, :last_name, :username, :password, presence: true
  validates :email, :username, uniqueness: true
  validates :email, format: { with: /.*@.*\..*/, message: "a valid email is required" }
  validates :avatar_url, format: { with: /((([A-Za-z]{3,9}:(?:\/\/)?)(?:[-;:&=\+\$,\w]+@)?[A-Za-z0-9.-]+|(?:www.|[-;:&=\+\$,\w]+@)[A-Za-z0-9.-]+)((?:\/[\+~%\/.\w-_]*)?\??(?:[-\+=&;%@.\w_]*)#?(?:[\w]*))?)/, message: "a valid url is required"}

end
