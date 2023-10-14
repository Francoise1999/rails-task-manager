class TasksController < ApplicationController
  # En tant qu’utilisateur, je peux lister des tâches
  # En tant qu’utilisateur, je peux afficher les détails d’une tâche
  # En tant qu’utilisateur, je peux ajouter une nouvelle tâche
  # En tant qu’utilisateur, je peux éditer une tâche (la marquer comme terminée / mettre à jour le titre et les détails)
  # En tant qu’utilisateur, je peux supprimer une tâche

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save

    redirect_to tasks_path
  end

  def show
    @tasks = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)

    redirect_to tasks_path
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

end
