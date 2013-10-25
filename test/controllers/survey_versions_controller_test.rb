require 'test_helper'

class SurveyVersionsControllerTest < ActionController::TestCase
  setup do
    @survey_version = survey_versions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:survey_versions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create survey_version" do
    assert_difference('SurveyVersion.count') do
      post :create, survey_version: { description: @survey_version.description, file: @survey_version.file, name: @survey_version.name, survey_id: @survey_version.survey_id }
    end

    assert_redirected_to survey_version_path(assigns(:survey_version))
  end

  test "should show survey_version" do
    get :show, id: @survey_version
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @survey_version
    assert_response :success
  end

  test "should update survey_version" do
    patch :update, id: @survey_version, survey_version: { description: @survey_version.description, file: @survey_version.file, name: @survey_version.name, survey_id: @survey_version.survey_id }
    assert_redirected_to survey_version_path(assigns(:survey_version))
  end

  test "should destroy survey_version" do
    assert_difference('SurveyVersion.count', -1) do
      delete :destroy, id: @survey_version
    end

    assert_redirected_to survey_versions_path
  end
end
