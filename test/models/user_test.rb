require 'test_helper'
require 'minitest/spec'

describe 'user tests' do
  it 'user with a valid email should be valid' do
    user = User.new(email: 'test@test.org', password_digest: 'test')
    assert user.valid? 
  end

  it 'user with invalid email should be invalid' do
    user = User.new(email: 'test', password_digest: 'test')
    assert !user.valid? 
  end

  it 'user with taken email should be invalid' do
    other_user = User.create(email: 'one@one.org', password_digest: 'hashed_password')
    user = User.new(email: other_user.email, password_digest: 'test')
    assert !user.valid? 
  end
end
