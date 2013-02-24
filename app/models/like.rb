class Like < ActiveRecord::Base
  include Startuplab::Guid

  belongs_to :author, class_name: 'User', :inverse_of => :comments
  belongs_to :target, touch: true, polymorphic: true

  attr_accessible :author_name, :guid, :positive
  xml_attr :target_type

  validates_uniqueness_of :target_id, :scope => [:target_type, :author_id]
  validates :parent, :presence => true

  def parent_class
    self.target_type.constantize
  end

  def parent
    self.target
  end

end
