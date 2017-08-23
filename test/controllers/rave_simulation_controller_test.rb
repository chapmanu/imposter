class RaveSimulationControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get rave_simulation_path
    assert_response :success
  end

  test "should show non-emergency RSS feed" do
    get rave_simulation_path

    # switch from on to off, emergency to non-emergency
    post rave_simulation_send_alert_path, params: { status: "on" }

    assert_redirected_to rave_simulation_path
  end

  test "should show emergency RSS feed" do
    get rave_simulation_path

    # switch from off to on, non-emergency to emergency
    post rave_simulation_send_alert_path, params: { status: "off" }

    assert_redirected_to rave_simulation_path
  end
end