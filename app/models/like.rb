class Like < ActiveRecord::Base
  include Startuplab::Guid

  belongs_to :author, class_name: 'User', :inverse_of => :likes
  belongs_to :target, touch: true, polymorphic: true

  before_validation :associate_author

  attr_accessible :author_id, :author_name, :guid, :positive
  #xml_attr :target_type
  attr_accessible :target_type

  validates :author_id, uniqueness: { :scope => :target_id }
  validates :target_id, uniqueness: { :scope => [:target_type, :author_id] }
  validates :parent, :presence => true

  def parent_class
    self.target_type.constantize
  end

  def parent
    self.target
  end

  private

  def associate_author
    unless self.author_id
      # TODO switch to this..
      # return self.user_id = session[:user_id] if session[:user_id]
      # false
      self.author_id = User.first.id
    end
    self.author_name = self.author.name
  end

end
