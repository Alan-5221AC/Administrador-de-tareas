require 'test_helper'

class TodasTareasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get todas_tareas_index_url
    assert_response :success
  end

end
