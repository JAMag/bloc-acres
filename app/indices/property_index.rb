ThinkingSphinx::Index.define :property, :with => :active_record do
#  indexes type, :sortable => true


  indexes description, :sortable => true
#  has_one :address
  indexes city, :sortable => true
  indexes state, :sortable => true
  indexes zip


#  indexes content
#  indexes author.name, :as => :author, :sortable => true

#  has author_id, created_at, updated_at
end