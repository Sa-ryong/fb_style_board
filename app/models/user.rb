class User < ActiveRecord::Base
  has_many :posts, :dependent => :destroy, :inverse_of => :user

  attr_accessible :email, :name
end
