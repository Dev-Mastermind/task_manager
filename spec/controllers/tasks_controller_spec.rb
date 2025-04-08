require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  let(:valid_attributes) do
    {
      title: "My Task",
      description: "This is a test task.",
      due_date: Date.today + 1.day,
      completed: false
    }
  end

  let(:invalid_attributes) do
    {
      title: "",
      description: "",
      due_date: nil
    }
  end

  describe "GET #index" do
    it "returns all tasks" do
      task = create(:task)
      get :index
      expect(response).to be_successful
      expect(assigns(:tasks)).to include(task)
    end

    it "filters completed tasks" do
      completed = create(:task, completed: true)
      pending = create(:task, completed: false)
      get :index, params: { status: "completed" }
      expect(assigns(:tasks)).to eq([ completed ])
    end

    it "filters pending tasks" do
      completed = create(:task, completed: true)
      pending = create(:task, completed: false)
      get :index, params: { status: "pending" }
      expect(assigns(:tasks)).to eq([ pending ])
    end
  end

  describe "GET #show" do
    it "returns the task" do
      task = create(:task)
      get :show, params: { id: task.id }
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "assigns a new task" do
      get :new
      expect(assigns(:task)).to be_a_new(Task)
    end
  end

  describe "GET #edit" do
    it "assigns the requested task" do
      task = create(:task)
      get :edit, params: { id: task.id }
      expect(assigns(:task)).to eq(task)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Task" do
        expect {
          post :create, params: { task: valid_attributes }
        }.to change(Task, :count).by(1)
      end

      it "redirects to the created task" do
        post :create, params: { task: valid_attributes }
        expect(response).to redirect_to(task_path(Task.last))
      end
    end

    context "with invalid params" do
      it "does not create a task" do
        expect {
          post :create, params: { task: invalid_attributes }
        }.to_not change(Task, :count)
      end

      it "renders new template" do
        post :create, params: { task: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH #update" do
    let(:task) { create(:task) }

    context "with valid params" do
      it "updates the task" do
        patch :update, params: { id: task.id, task: { title: "Updated" } }
        expect(task.reload.title).to eq("Updated")
        expect(response).to redirect_to(task_path(task))
      end
    end

    context "with invalid params" do
      it "does not update the task" do
        patch :update, params: { id: task.id, task: { title: "" } }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the task" do
      task = create(:task)
      expect {
        delete :destroy, params: { id: task.id }
      }.to change(Task, :count).by(-1)
    end

    it "redirects to index" do
      task = create(:task)
      delete :destroy, params: { id: task.id }
      expect(response).to redirect_to(tasks_path)
    end
  end
end
