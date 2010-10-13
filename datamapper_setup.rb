# setup datamapper instance
require 'rubygems'
require 'dm-core'
require 'dm-aggregates'
require 'dm-serializer'
require 'yaml'

db_config = YAML.parse(File.open(File.join('config','database.yml')))
db = db_config['production']
DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(
  :default,
  "#{db['adapter'].value}://#{db['username'].value}:#{db['password'].value}@#{db['host'].value}/#{db['database'].value}"
)


class Category
  include DataMapper::Resource

  property :id, Serial
  property :name, String, :length => 255, :required => true
  property :url_name, String, :length => 255
  
  has n, :subcategories
  
  def url
    "/products/" + self.id.to_s + "/" + self.name.downcase.gsub(/\W+/,'-')
  end
  
end

class Subcategory
  include DataMapper::Resource

  property :id, Serial
  property :category_id, Integer
  property :tmp, Integer
  property :name, String, :length => 255, :required => true
  
  belongs_to :category
  
  def url
    "/" + self.id.to_s + "/" + self.name.downcase.gsub(/\W+/,'-')
  end
  
  
end

