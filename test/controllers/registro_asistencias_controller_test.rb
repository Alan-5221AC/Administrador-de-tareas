require 'test_helper'

class RegistroAsistenciasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get registro_asistencias_index_url
    assert_response :success
  end

end
