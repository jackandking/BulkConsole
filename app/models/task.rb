class Task < ActiveRecord::Base
  @@work_dir = "d:/bulkconsole/"
  @@timeout = 60*30

  belongs_to :tool
  has_one :configure
  has_one :result

  def initialize
    Dir.mkdir(@@work_dir) unless File.exist?(@@work_dir)
    super()
  end

  state_machine :state, :initial => :created do

    before_transition :created => :configured do |task, transition|
      mydir = @@work_dir + "#{task.id}/"
      if File.exist?(mydir)
        p "#{mydir} already exist, something wrong"
        #raise "#{mydir} already exist, something wrong"
      else
        Dir.mkdir(mydir) 
      end
      task.logger.debug "task dir: #{mydir}"
    end

    before_transition :configured => :executing do |task, transition|
      Configure.column_names.grep(/[s|if]\d/).each do |c|
        pram = eval("task.configure."+c)
        if pram and !pram.empty? 
          eval("@" + c + " = pram")
          task.logger.debug "@#{c} = #{pram}"
        end
      end
      cmd = task.tool.cmd
      begin
        cmd = eval("\""+cmd+"\"")
      rescue NameError => e
        task.logger.error e
        task.error = e
      end
      task.logger.info "filled cmd: " + cmd
      task.cmd = cmd
    end

    after_transition :configured => :executing do |task, transition|
      task.e_execute
    end

    before_transition :executing=> :executed do |task, transition|
      mydir = @@work_dir + "#{task.id}/"
      now = Time.now.to_f
      logfile = mydir + "log.#{now}"
      task.logger.debug "logfile: " + logfile

      ret = 0
      begin
        timeout(@@timeout) do
          ret = system(task.cmd + " > #{logfile} 2>&1")
        end
      rescue Timeout::Error
        task.logger.error "Timeout when executing CMD: " + task.cmd
        return
      end
      if ret == nil
        task.logger.error "Wrong CMD: " + task.cmd
      end
      result=Result.new
      result.task_id = task.id
      result.stdout= logfile #File.read(stdout)
      result.return= $?.exitstatus
      Configure.column_names.grep(/of\d/).each do |c|
        of = eval("task.configure."+c)
        if of and !of.empty? 
          if File.exist? of
            eval("result."+c+" = task.configure."+c)
          else
            eval("result."+c+" = 'Error: File Not Fould'")
          end
        end
      end
      result.save
      task.result_id = result.id
    end

    event :e_configure do
      p "e_configure"
      transition :created => :configured
    end
    event :e_execute do
      p "e_execute"
      transition :configured => :executing
      transition :executing => :executed
    end
  end

end
