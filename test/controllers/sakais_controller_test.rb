require 'test_helper'

class SakaisControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sakais_index_url
    assert_response :success
  end

end
