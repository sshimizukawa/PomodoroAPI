require "test_helper"

class MusicSessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get music_sessions_new_url
    assert_response :success
  end

  test "should get show" do
    get music_sessions_show_url
    assert_response :success
  end
end
