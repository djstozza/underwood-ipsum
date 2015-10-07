require 'test_helper'

class TvcharactersControllerTest < ActionController::TestCase
  setup do
    @tvcharacter = tvcharacters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tvcharacters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tvcharacter" do
    assert_difference('Tvcharacter.count') do
      post :create, tvcharacter: { name: @tvcharacter.name }
    end

    assert_redirected_to tvcharacter_path(assigns(:tvcharacter))
  end

  test "should show tvcharacter" do
    get :show, id: @tvcharacter
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tvcharacter
    assert_response :success
  end

  test "should update tvcharacter" do
    patch :update, id: @tvcharacter, tvcharacter: { name: @tvcharacter.name }
    assert_redirected_to tvcharacter_path(assigns(:tvcharacter))
  end

  test "should destroy tvcharacter" do
    assert_difference('Tvcharacter.count', -1) do
      delete :destroy, id: @tvcharacter
    end

    assert_redirected_to tvcharacters_path
  end
end
