class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :execute, :destroy]

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
    @task.owner = "TBD"
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render action: 'show', status: :created, location: @task }
      else
        format.html { render action: 'new' }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def execute
    Configure.column_names.grep(/[s|if]\d/).each do |c|
      eval("@"+c+" = @task.configure."+c)
    end
    p @s1
    p @if1
    @cmd = @task.tool.cmd
    p @cmd
    @cmd=eval("\""+@cmd+"\"")
    logger.info @cmd
    p "before execute"+@task.state
    @task.cmd=@cmd
    @task.e_execute
    p "after execute"+@task.state
    now=Time.now.nsec
    stdout = "d:/log.#{now}"
    p stdout
    r = system(@cmd+" > #{stdout} 2>&1")
    @result=Result.new
    @result.task_id = @task.id
    @result.stdout= stdout #File.read(stdout)
    @result.return= $?.exitstatus
    Configure.column_names.grep(/of\d/).each do |c|
      of = eval("@task.configure."+c)
      if of and !of.empty? 
        if File.exist? of
          eval("@result."+c+" = @task.configure."+c)
        else
          eval("@result."+c+" = 'Error: File Not Fould'")
        end
      end
    end
    @result.save
    @task.result_id=@result.id
    if @task.save
      render "results/show"
      #render :controller => :results, :action => :show, :id => @result.id
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:owner, :desc, :tool_id, :configure_id, :result_id, :state)
    end
end
