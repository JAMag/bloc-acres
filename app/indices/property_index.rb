ThinkingSphinx::Index.define :property, :with => :active_record do
  indexes structure
  indexes state
  indexes city
  indexes beds, :sortable => true
  indexes baths, :sortable => true
  indexes price, :sortable => true
end