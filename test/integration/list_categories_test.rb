require 'test_helper'

class ListCategoriesTest < ActionDispatch::IntegrationTest
  def setup
    @category = Category.create(name: 'Sports') # needs create to save the category into the database
    @category2 = Category.create(name: 'Travel')
  end

  test "should show categories listing" do
    get '/categories' # go to this path
    assert_select 'a[href=?]', category_path(@category), text: @category.name # check if links exist (a[href] and the text of the category should show up) for the specific category (show pages)
    assert_select 'a[href=?]', category_path(@category2), text: @category2.name
  end
end
