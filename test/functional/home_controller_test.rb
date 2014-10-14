require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_not_equal 0,assigns(:inventory).count, "ERROR:No Results found"
    assert_not_equal 0,assigns(:items).count, "ERROR:No page found"
    assert_response :success
  end

end
