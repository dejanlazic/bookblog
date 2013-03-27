require 'test/test_helper'
#require File.dirname(__FILE__) + '/../../test_helper'
#require 'admin/author_controller'

class AuthorsControllerTest < ActionController::TestCase
  setup do
    @author = authors(:one)

   #@controller = Admin::AuthorController.new
   @request = ActionController::TestRequest.new
   @response = ActionController::TestResponse.new
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:authors)
  end

  test "should get new" do
    get :new

    assert_response :success

    assert_template 'author/new'
    assert_tag 'h1', :content => 'Create new author'
    assert_tag 'form', :attributes => {:action => 'author/create'}
  end

  test "should create author" do
    assert_difference('Author.count') do
      post :create, :author => { :first_name => @author.first_name, :last_name => @author.last_name }
    end

    assert_redirected_to author_path(assigns(:author))
  end

  test "should show author" do
    get :show, :id => @author
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @author
    assert_response :success
  end

  test "should update author" do
    put :update, :id => @author, :author => { :first_name => @author.first_name, :last_name => @author.last_name }
    assert_redirected_to author_path(assigns(:author))
  end

  test "should destroy author" do
    assert_difference('Author.count', -1) do
      delete :destroy, :id => @author
    end

    assert_redirected_to authors_path
  end
end
