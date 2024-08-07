# frozen_string_literal: true

require('test_helper')

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create(::TEST_USER_DATA)
  end

  test 'should get index' do
    get(users_url)
    assert_response :success
  end

  test 'should get new' do
    get('/users/')
    assert_response :success
  end

  test 'should create user' do
    data = ::TEST_USER_DATA.dup
    data[:username] = 'test'
    data[:email] = 'example@mail.com'
    data[:mobile] = '5512345678'
    assert_difference('User.count') do
      post(users_url, params: { user: data })
    end

    assert_redirected_to articles_url
  end

  test 'should show user' do
    get user_url(@user)
    assert_response :success
  end

  test 'should get edit' do
    @user.save
    post('/login', params: { session: TEST_SESSION_DATA })
    get edit_user_url(User.find_by(email: TEST_SESSION_DATA[:username]))
    assert_response :success
  end

  test 'should update user' do
    @user.save
    post('/login', params: { session: TEST_SESSION_DATA })
    patch(user_url(@user), params: { user: { password: 'new_pass' } })
    assert_redirected_to(user_url(@user))
  end
end
