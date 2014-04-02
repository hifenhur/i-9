# -*- encoding : utf-8 -*-
require 'test_helper'

class EstudosControllerTest < ActionController::TestCase
  setup do
    @estudo = estudos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:estudos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create estudo" do
    assert_difference('Estudo.count') do
      post :create, estudo: { description: @estudo.description, image: @estudo.image, title: @estudo.title }
    end

    assert_redirected_to estudo_path(assigns(:estudo))
  end

  test "should show estudo" do
    get :show, id: @estudo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @estudo
    assert_response :success
  end

  test "should update estudo" do
    patch :update, id: @estudo, estudo: { description: @estudo.description, image: @estudo.image, title: @estudo.title }
    assert_redirected_to estudo_path(assigns(:estudo))
  end

  test "should destroy estudo" do
    assert_difference('Estudo.count', -1) do
      delete :destroy, id: @estudo
    end

    assert_redirected_to estudos_path
  end
end
