require 'test_helper'

class Api::V1::UsersControllerTest < ActionDispatch::IntegrationTest
  setup do 
    @user = User.create(email: 'one@one.org', password_digest: 'hashed_password')
  end

  test "should show user" do 
    get api_v1_user_url(@user), as: :json        
    assert_response :success 
    # Test to ensure response contains the correct email 
    json_response = JSON.parse(self.response.body) 
    assert_equal @user.email, json_response['email'] 
  end
end
