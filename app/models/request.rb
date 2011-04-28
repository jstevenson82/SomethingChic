class Request < ActiveRecord::Base
  class_inheritable_accessor :columns
  self.columns = []
     
  def self.column(name, sql_type = nil, default = nil, null = true)
     columns << ActiveRecord::ConnectionAdapters::Column.new(name.to_s, default, sql_type.to_s, null)
  end

 #insert the names of the form fields here
 column :name, :string
 column :phonenumber, :string
 column :email, :string
 column :eventdate, :date
 column :guests, :integer
 column :eventtype, :string
 column :name, :string
 column :phonenumber, :string
 column :contactMeBy, :string
 column :address, :string
 column :city, :string
 column :state, :string
 column :zipcode, :string
 column :otherinfo, :text
 column :heardaboutus, :text
       
 #standard validations will go here
  validates_presence_of :name, :phonenumber, :eventdate, :guests, :eventtype
end