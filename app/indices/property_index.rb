ThinkingSphinx::Index.define :property, :with => :active_record do
  
  indexes description
  indexes state
#  has_one :city
#  has_one :state
#  has_one :zip

  #has author_id, created_at, updated_at
end