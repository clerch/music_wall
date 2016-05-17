class Track < ActiveRecord::Base

  belongs_to :user
  has_many :upvotes

  validates :song_title, presence: true
  validates :author, presence: true
  validates :url, format: { with: /((([A-Za-z]{3,9}:(?:\/\/)?)(?:[-;:&=\+\$,\w]+@)?[A-Za-z0-9.-]+|(?:www.|[-;:&=\+\$,\w]+@)[A-Za-z0-9.-]+)((?:\/[\+~%\/.\w-_]*)?\??(?:[-\+=&;%@.\w_]*)#?(?:[\w]*))?)/, message: "a valid url is required" }



end
