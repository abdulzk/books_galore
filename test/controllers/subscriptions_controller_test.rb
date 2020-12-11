require 'test_helper'
require 'stripe'

class SubscriptionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get subscriptions_index_url
    assert_response :success
  end

end
