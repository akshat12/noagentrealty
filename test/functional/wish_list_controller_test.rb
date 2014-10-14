require 'test_helper'

class WishListControllerTest < ActionController::TestCase
  setup do
    @controller = WishListsController.new
    @wish_list = wish_lists(:wish_list_test_one)
    @user = users(:search_user1)
  end
  
    test "should create wish list" do
    assert_difference('WishList.count') do
      post :create, wish_list: { category: @wish_list.category, description: @wish_list.description, location: @wish_list.location, name: @wish_list.name, condition: @wish_list.condition, quantity: @wish_list.quantity }
    end

    assert_redirected_to wish_list_path(assigns(:wish_list))
  end
  
  test "should get new" do
    get :new
    assert_response :success
  end
  
    test "should show wish list" do
    get :show, id: @wish_list
    assert_response :success
  end
  
    test "should get edit" do
    get :edit, id: @wish_list
    assert_response :success
  end

    test "should update wish list" do
    put :update, id: @wish_list, wish_list: { category: @wish_list.category, description: @wish_list.description, location: @wish_list.location, name: @wish_list.name }
    assert_redirected_to wish_list_path(assigns(:wish_list))
  end

  test "should destroy wish list" do
    assert_difference('WishList.count', -1) do
      delete :destroy, id: @wish_list
    end

    assert_redirected_to wish_lists_path
  end
end