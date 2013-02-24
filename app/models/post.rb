class Post < ActiveRecord::Base
  include Startuplab::Likeable

  belongs_to :user, :inverse_of => :posts
  has_many :comments, :as => :commentable

  after_initialize do |post|
    post.writer = post.user.name
  end

  attr_accessible :subject, :body, :like, :dislike, :user_id, :writer
  default_scope order: 'posts.created_at DESC'

  validates :user_id, presence: true

#  validates_associated :users

end
