require 'rubygems'
require 'sinatra'
require 'erb'

before do
  @pages = ['home', 'products', "about", "contact"]
end

['/', '/home'].each do |path|
  get path do
    @meta         = "All Propane LPG, Your source for liquefied petroleum gas (LP-Gas) products, parts, and accessories."
    @active_page  = 'home'
    @page_title   = "Welcome!"
    @content      = erb :home
    erb :"layouts/home"
  end
end

get '/products' do
  require 'datamapper_setup.rb'
  
  @cats           = Category.all
  @meta           = ''
  @page_title     = "Product Listings"
  @page_subtitle  = "All Propane LPG carries an extensive inventory of products from all major brands."
  @active_page    = 'products'
  @content        = erb :"products/index"
  erb :"layouts/main"
end

get '/products/:cat_id/:category' do
  require 'datamapper_setup.rb'
  
  cat_id    = params[:cat_id].to_i
  @category = Category.get(cat_id)
  raise Sinatra::NotFound if @category.nil?
  
  @page_title     = "Sample Product Listings"
  @page_subtitle  = "All Propane LPG carries an extensive inventory of products from all major brands."
  @meta           = ''
  @active_page    = 'products'
  @content        = erb :"products/category"
  erb :"layouts/main"
end

get '/products/:cat_id/:category/:subcat_id/:subcategory' do
  require 'datamapper_setup.rb'
  
  cat_id    = params[:cat_id].to_i
  @category = Category.get(cat_id)
  raise Sinatra::NotFound if @category.nil?
  
  subcat_id    = params[:subcat_id].to_i
  @subcategory = @category.subcategories.get(subcat_id)
  raise Sinatra::NotFound if @subcategory.nil?
  
  @meta           = ''  
  @page_title     = "Sample Product Listings"
  @page_subtitle  = "All Propane LPG carries an extensive inventory of products from all major brands."
  @active_page    = 'products'
  @content        = erb :"products/subcategory"
  erb :"layouts/main"
end

get '/about' do
  @meta           = ""
  @page_title     = "About Us";
  @page_subtitle  = "All Propane LPG, Your source for liquefied petroleum gas (LP-Gas) products, parts, and accessories.";
  @active_page    = 'about'
  @content        = erb :about
  erb :"layouts/main"
end

get '/contact' do
  @meta           = ""
  @page_title     = "Contact Us"
  @page_subtitle  = "Customer service is our #1 priority."
  @active_page    = 'contact'
  @content        = erb :contact
  erb :"layouts/main"
end

not_found do
  @meta       = '404 Not Found'
  @page_title = "404 Not Found"
  @content    = erb :error_404
  erb :"layouts/main"
end