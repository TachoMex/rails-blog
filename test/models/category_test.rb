# frozen_string_literal: true

require('test_helper')

class CategoryTest < ActiveSupport::TestCase
  def setup
    @category = Category.new(name: 'math')
  end

  test 'category should be valid' do
    assert(@category.valid?)
  end

  test 'name should be present' do
    @category.name = ' '
    refute(@category.valid?)
  end

  test 'name should be unique' do
    @category.save
    category2 = Category.new(name: 'math')
    refute(category2.valid?)
  end

  test 'name should not be too long' do
    @category.name = 'x' * 33
    refute(@category.valid?)
  end

  test 'name should not be too short' do
    @category.name = 'xx'
    refute(@category.valid?)
  end
end
