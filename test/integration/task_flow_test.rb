require 'test_helper'

class TaskFlowTest < ActionDispatch::IntegrationTest
  fixtures :tasks
  test "the truth" do
    assert true
  end

  test "run task"  do
    p tasks(:test).e_configure
    get '/tasks/1/execute'
    p tasks(:test).e_execute
    p tasks(:test).result.id
    p tasks(:test).result.return
    p tasks(:test).result.stdout
    p tasks(:test).result.of1
  end
end
