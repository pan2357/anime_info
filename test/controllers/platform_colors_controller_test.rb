require "test_helper"

class PlatformColorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @platform_color = platform_colors(:one)
  end

  test "should get index" do
    get platform_colors_url
    assert_response :success
  end

  test "should get new" do
    get new_platform_color_url
    assert_response :success
  end

  test "should create platform_color" do
    assert_difference('PlatformColor.count') do
      post platform_colors_url, params: { platform_color: { color: @platform_color.color, platform: @platform_color.platform } }
    end

    assert_redirected_to platform_color_url(PlatformColor.last)
  end

  test "should show platform_color" do
    get platform_color_url(@platform_color)
    assert_response :success
  end

  test "should get edit" do
    get edit_platform_color_url(@platform_color)
    assert_response :success
  end

  test "should update platform_color" do
    patch platform_color_url(@platform_color), params: { platform_color: { color: @platform_color.color, platform: @platform_color.platform } }
    assert_redirected_to platform_color_url(@platform_color)
  end

  test "should destroy platform_color" do
    assert_difference('PlatformColor.count', -1) do
      delete platform_color_url(@platform_color)
    end

    assert_redirected_to platform_colors_url
  end
end
