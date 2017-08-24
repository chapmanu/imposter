class HomeControllerTest < ActionDispatch::IntegrationTest
  
  test "should turn on alert state" do
    # should be off by default, if not previously set
    assert_equal "off", Rails.cache.read("rave_status")

    get home_send_alert_path
    
    assert_redirected_to root_path
    assert_equal "on", Rails.cache.read("rave_status")
  end

  test "should turn off alert state" do
    get home_send_alert_path, params: {:status => "on"}

    assert_redirected_to root_path
    assert_equal "off", Rails.cache.read("rave_status")
  end

end