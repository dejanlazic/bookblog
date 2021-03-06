require 'test_helper'
# require File.dirname(__FILE__) + '/../test_helper'
# require File.expand_path('../../config/environment', __FILE__)

# to run tests: rake

class AuthorTest < ActiveSupport::TestCase
#class AuthorTest < Test::Unit::TestCase
  fixtures :authors

def test_name
  author = Author.create(:first_name => 'Joel', :last_name => 'Spolsky')
  assert_equal 'Joel Spolsky', author.name
end

def test_create
 get :new

 assert_template 'admin/author/new'
 assert_difference(Author, :count) do
  post :create, :author => {:first_name => 'Joel', :last_name => 'Spolsky'}
  assert_response :redirect
  assert_redirected_to :action => 'index'
 end
 assert_equal 'Author Joel Spolsky was successfully created.', flash[:notice]
end

def test_failing_create
 assert_no_difference(Author, :count) do
  post :create, :author => {:first_name => 'Joel'}

  assert_response :success
  assert_template 'admin/author/new'
  assert_tag :tag => 'div', :attributes => {:class => 'fieldWithErrors'}
 end
end

def test_destroy
 assert_difference(Author, :count, -1) do
  post :destroy, :id => 1

  assert_response :redirect
  assert_redirected_to :action => 'index'
 end
end

def test_index
 get :index

 assert_response :success
 assert_tag :tag => 'table', :children => { :count => Author.count + 1, :only => {:tag => 'tr'} }
 Author.find(:all).each do |a|
  assert_tag :tag => 'td', :content => a.first_name
  assert_tag :tag => 'td', :content => a.last_name
 end
end

def test_show
 get :show, :id => 1
 
 assert_template 'admin/author/show'
 assert_equal 'Joel', assigns(:author).first_name
 assert_equal 'Spolsky', assigns(:author).last_name
end

def test_edit
 get :edit, :id => 1

 assert_tag :tag => 'input', :attributes => { :name => 'author[first_name]', :value => 'Joel' }
 assert_tag :tag => 'input', :attributes => { :name => 'author[last_name]', :value => 'Spolsky' }
end

end
