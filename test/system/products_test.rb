require "application_system_test_case"
require "test_helper"

class ProductsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit root_url # "/"
    assert_selector "h1", text: "Awesome Products"
  end
end
