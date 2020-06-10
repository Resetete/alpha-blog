require 'test_helper'

class SignUpUserTest < ActionDispatch::IntegrationTest
  setup do
    @admin_user = User.create(username: 'admin', email: 'admin@example.com', password: '123456', admin: true)
    @regular_user = User.create(username: 'user1', email: 'user1@example.com', password: '123456', admin: false)
  end

  test 'should sign in as regular user' do
    get login_path
    sign_in_as(@regular_user)
    follow_redirect!
    assert_match 'Logged in successully', response.body
  end

  test 'should sign in as admin user' do
    get login_path
    sign_in_as(@admin_user)
    follow_redirect!
    assert_match 'Logged in successully', response.body
    assert_match '(Admin)', response.body
  end

  test 'get signup for and successully sign up user' do
    get signup_path
    assert_response :success
    assert_difference 'User.count',1 do
      post users_path, params: { user: { username: 'New test user', email: 'testuser@example.com', password: '123456' } }
      assert_response :redirect
    end
    follow_redirect!

    assert_match 'New test user, Welcome', response.body
  end
end
