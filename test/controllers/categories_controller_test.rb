# frozen_string_literal: true

require('test_helper')

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = login!
    @category = Category.new(name: 'math')
  end

  test 'should get index' do
    get categories_url
    assert_response :success
  end

  test 'should get new' do
    get new_category_url
    assert_response :success
  end

  test 'should create category' do
    assert_difference('Category.count', 1) do
      post(categories_url, params: { category: { name: 'programming' } })
    end

    assert_redirected_to categories_url
  end

  test 'should show category' do
    @category.save
    get category_url(@category)
    assert_response :success
  end
end
