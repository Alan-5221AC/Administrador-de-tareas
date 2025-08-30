require 'test_helper'

class TareasPendientesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tareas_pendientes_index_url
    assert_response :success
  end

end
