require 'test_helper'

class HuntsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hunts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hunt" do
    assert_difference('Hunt.count') do
      post :create, :hunt => { }
    end

    assert_redirected_to hunt_path(assigns(:hunt))
  end

  test "should show hunt" do
    get :show, :id => hunts(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => hunts(:one).id
    assert_response :success
  end

  test "should update hunt" do
    put :update, :id => hunts(:one).id, :hunt => { }
    assert_redirected_to hunt_path(assigns(:hunt))
  end

  test "should destroy hunt" do
    assert_difference('Hunt.count', -1) do
      delete :destroy, :id => hunts(:one).id
    end

    assert_redirected_to hunts_path
  end
end
