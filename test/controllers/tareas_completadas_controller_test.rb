require 'test_helper'

class TareasCompletadasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tareas_completadas_index_url
    assert_response :success
  end

end
