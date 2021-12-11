require "test_helper"

class AnimesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @anime = animes(:one)
  end

  test "should get index" do
    get animes_url
    assert_response :success
  end

  test "should get new" do
    get new_anime_url
    assert_response :success
  end

  test "should create anime" do
    assert_difference('Anime.count') do
      post animes_url, params: { anime: { day_in_week: @anime.day_in_week, episode: @anime.episode, name: @anime.name, on_air: @anime.on_air, show_time: @anime.show_time, synopsis: @anime.synopsis } }
    end

    assert_redirected_to anime_url(Anime.last)
  end

  test "should show anime" do
    get anime_url(@anime)
    assert_response :success
  end

  test "should get edit" do
    get edit_anime_url(@anime)
    assert_response :success
  end

  test "should update anime" do
    patch anime_url(@anime), params: { anime: { day_in_week: @anime.day_in_week, episode: @anime.episode, name: @anime.name, on_air: @anime.on_air, show_time: @anime.show_time, synopsis: @anime.synopsis } }
    assert_redirected_to anime_url(@anime)
  end

  test "should destroy anime" do
    assert_difference('Anime.count', -1) do
      delete anime_url(@anime)
    end

    assert_redirected_to animes_url
  end
end
