require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'user with a valid email should be valid' do
    user = User.new(email: 'test@test.org', password_digest: 'test')
    assert user.valid? 
  end

  test 'user with invalid email should be invalid' do
    user = User.new(email: 'test', password_digest: 'test')
    assert !user.valid? 
  end

  test 'user with taken email should be invalid' do
    other_user = User.create(email: 'one@one.org', password_digest: 'hashed_password')
    user = User.new(email: other_user.email, password_digest: 'test')
    assert !user.valid? 
  end

  test 'destroy user should destroy linked product' do
    user = User.create!(email: 'test@email.com', password: 'test')
    user.products.create(title: 'pr1', price: 0, published: 1)
    assert_difference('Product.count', -1) do
      user.destroy
    end
  end
end
