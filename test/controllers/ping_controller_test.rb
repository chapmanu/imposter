class PingControllerTest < ActionDispatch::IntegrationTest
  test "Ping responds with json" do
    get ping_url
    response_body = JSON.parse(response.body)
    assert_equal 'pong', response_body['data']
  end
end
