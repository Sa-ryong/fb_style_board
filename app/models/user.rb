class User < ActiveRecord::Base
  has_many :posts, :dependent => :destroy, :inverse_of => :user
  has_many :likes

  attr_accessible :email, :name

  validates :name, :email, presence: true
  validates :email, uniqueness: true


  # Social activities
  def like!(target, opts={})
    opts.merge! author_id: self.id
    target.likes.create! opts
  end

  def like?(target)
    !target.likes.empty? && target.likes.exists?(author_id: self.id)
  end

  def dislike!(target, opts={})
    opts.merge! author_id: self.id
    target.dislikes.create! opts
  end

  def dislike?(target)
    !target.dislikes.empty? && target.dislikes.exists?(author_id: self.id)
  end
end
