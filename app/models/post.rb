class Post < ActiveRecord::Base
  belongs_to :user, :inverse_of => :posts

  attr_accessible :subject, :body, :like, :dislike, :user_id, :writer

  validates :user_id, presence: true

#  validates_associated :users

end
