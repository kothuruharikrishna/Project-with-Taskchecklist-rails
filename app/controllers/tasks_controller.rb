class TasksController < ApplicationController
  
  def new
  	@project= Project.find(params[:id])
  	@task= @project.tasks.new
  end
  def create
    @task = Task.create(task_params)
    flash[:success] = "Task is Created sucessfully"
    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.js
    end
  end

  def edit
    @task = Task.find(params[:id])
    respond_to do |format|
      format.html 
      format.js
    end
  end
  def update
    @task = Task.find(params[:id])
    @task.update_attributes!(task_params)
    flash[:success] = "Task is Updated sucessfully"
    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.js
    end
  end
	def destroy
		@task = Task.destroy(params[:id])
    flash[:success] = "Task is Destroy sucessfully"
		respond_to do |format|
			format.html { redirect_to tasks_url }
			format.js
		end
	end
 private
	def task_params
		params.require(:task).permit(:name,:complete,:project_id)
	end
end
