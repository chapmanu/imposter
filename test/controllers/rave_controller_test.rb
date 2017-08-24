# frozen_string_literal: true

class RaveControllerTest < ActionDispatch::IntegrationTest
  test "should simulate emergency alerts" do
    Rails.cache.write("rave_status", "on")
    get rave_url(:rss)

    assert_response :success
    assert_select "title", "Chapman Panther Alerts"
    assert_select "pubDate", Time.zone.now.strftime("%m/%d/%Y%l:%M%p")
    assert_includes @response.body, "ALERT: There is an emergency."
  end

  test "should simulate non-emergencies" do
    Rails.cache.write("rave_status", "off")
    get rave_url(:rss)

    assert_response :success
    assert_includes @response.body, "There is currently no emergency."
  end
end
