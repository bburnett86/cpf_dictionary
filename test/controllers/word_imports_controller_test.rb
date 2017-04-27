require 'test_helper'

class WordImportsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get word_imports_new_url
    assert_response :success
  end

end
