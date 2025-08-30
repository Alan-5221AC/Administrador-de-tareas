require 'test_helper'

class CalendarioActicvidadesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get calendario_acticvidades_index_url
    assert_response :success
  end

end
