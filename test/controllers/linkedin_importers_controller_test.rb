require 'test_helper'

class LinkedinImportersControllerTest < ActionController::TestCase
  setup do
    @linkedin_importer = linkedin_importers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:linkedin_importers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create linkedin_importer" do
    assert_difference('LinkedinImporter.count') do
      post :create, linkedin_importer: {  }
    end

    assert_redirected_to linkedin_importer_path(assigns(:linkedin_importer))
  end

  test "should show linkedin_importer" do
    get :show, id: @linkedin_importer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @linkedin_importer
    assert_response :success
  end

  test "should update linkedin_importer" do
    patch :update, id: @linkedin_importer, linkedin_importer: {  }
    assert_redirected_to linkedin_importer_path(assigns(:linkedin_importer))
  end

  test "should destroy linkedin_importer" do
    assert_difference('LinkedinImporter.count', -1) do
      delete :destroy, id: @linkedin_importer
    end

    assert_redirected_to linkedin_importers_path
  end
end
