class Task < ActiveRecord::Base
  attr_accessor :cmd
  belongs_to :tool
  has_one :configure
  has_one :result

  state_machine :state, :initial => :created do
    before_transition :configured => :executed do |task, transition|
      p "run_tool:"
      p task.tool_id
      p task.cmd
    end
    event :e_configure do
      p "configure"
      transition :created => :configured
    end
    event :e_execute do
      p "execute"
      transition :configured => :executed
    end
  end

end
