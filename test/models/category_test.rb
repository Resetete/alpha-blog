require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  def setup
    @category = Category.new(name: 'sports') # create the instance variable
  end

  test "category should be valid" do
    @category.name = 'sports'
    assert @category.valid? # check if that category is valid
  end

  test "name should be present" do
    @category.name = " "
    assert_not @category.valid? # the variable should not be valid (true) -> needs to add validation to model
  end

  test "name should be unique with case sensistivity" do
    @category.save # store the first category object in the test database
    @category2 = Category.new(name: 'Sports')
    assert_not @category2.valid?
  end

  test "name should not be too long" do
    @category.name = 'a' * 26
    assert_not @category.valid?
  end

  test "name should not be too short" do
    @category.name = 'aa'
    assert_not @category.valid?
  end

end
