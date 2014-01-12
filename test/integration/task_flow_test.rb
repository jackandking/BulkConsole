require 'test_helper'

class TaskFlowTest < ActionDispatch::IntegrationTest
  fixtures :tasks
  test "the truth" do
    assert true
  end

  test "run task"  do
    p tasks(:test).e_configure
    get '/tasks/1/execute'
    #p tasks(:test).e_execute
    p tasks(:test).result.id
    p tasks(:test).result.return
    p tasks(:test).result.stdout
    p tasks(:test).result.of1
  end

  test "run new task" do
    to=Tool.new
    to.cmd = 'dir #{@s1}'
    to.name = 'testT'
    to.desc = 'it is a test.'
    to.p1 = 's1'
    to.p1_desc = 'folder'
    to.save
    c=Configure.new
    c.s1 = '.'
    c.save
    t=Task.new
    t.id=Time.now.nsec
    t.tool=to
    t.configure=c
    t.save
    t.e_configure
    t.e_execute
    p t.result
  end
    
end
