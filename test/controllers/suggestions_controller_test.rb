require 'test_helper'

class SuggestionsControllerTest < ActionDispatch::IntegrationTest
  test "should get q" do
    get suggestions_q_url
    assert_response :success
  end

end
