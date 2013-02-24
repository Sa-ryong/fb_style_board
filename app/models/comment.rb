class Comment < ActiveRecord::Base
  include Startuplab::Guid
  include Startuplab::Likeable

  belongs_to :user, :inverse_of => :comments
  belongs_to :commentable, touch: true, polymorphic: true

  attr_accessible :body, :author_name, :likes_count

end
