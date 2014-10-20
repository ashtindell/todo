require 'spec_helper'

describe TasksController, type: :controller do 
  describe "GET show" do
    let(:task) { FactoryGirl.create(:task) }

    it "renders :show page" do
      get :show, id: task.id
      expect(response).to render_template(:show)
    end

    it "assigns requested task to @task" do
      get :show, id: task.id
      expect(assigns(:task)).to eq(task)
    end
  end

  describe "GET new" do
    it "assigns new task to @task" do
      get :new
      expect(assigns(:task)).to be_a_new(Task) # confirm that @task = Task.new
    end
    it "renders :new" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST create task" do
    context "valid attributes" do
      it "creates task" do
        # when I post to the create action, change Task.count by 1, aka add 1 to the tasks db
        expect{
          post :create, task: { title: "Walk Molly" }
        }.to change(Task, :count).by(1)
      end
      it  "redirects to :show" do
        post :create, task: { title: "Walk Molly" }
        last_task = Task.last
        expect(response).to redirect_to(task_path(last_task.id))
      end
    end

    context "invalid attributes" do
      it "does not create task" do
        expect{
        post :create, task: { title: "" }
        }.to_not change(Task, :count)
      end
      it "re-renders :new" do
        post :create, task: { title: "" }
        expect(response).to render_template(:new)
      end
    end
  end


  describe "GET index" do
    before { Task.destroy_all }

    let(:first_task)  { FactoryGirl.create(:task) }
    let(:second_task) { FactoryGirl.create(:task) }

    it "renders :index" do
      get :index
      expect(response).to render_template(:index)
    end

    it "assigns all tasks to @tasks as an array" do
      get :index
      expect(assigns(:tasks)).to eq( [first_task, second_task] )
    end
  end


  describe "GET edit task" do
    let(:task) { FactoryGirl.create(:task) }
    it "renders :edit" do
      get :edit, id: task.id
      expect(response).to render_template(:edit)
    end

    it "assigns requested task to @task" do
      get :edit, id: task.id
      expect(assigns(:task)).to eq(task)
    end
  end

  describe "PUT update" do
    let(:task) { FactoryGirl.create(:task) }

    context "valid attributes" do
      it "changes @task attributes" do
        put :update, id: task.id, task: { title: "Do the dishes" }
        task.reload
        expect(task.title).to eq("Do the dishes")
      end

      it "redirects to :show" do
        put :update, id: task.id, task: { title: "Do the dishes" }
        last_task = Task.last
        expect(response).to redirect_to(task_path(last_task.id))
      end
    end

    context "invalid attributes" do
      it "does not change @task's attributes" do
        put :update, id: task.id, task: { title: "" }
        task.reload
        expect(task.title).to eq("Walk the dog")
      end

      it "re-renders :edit" do
        put :update, id: task.id, task: { title: "" }
        expect(response).to render_template(:edit)
      end
    end    
  end

  describe "DELETE destroy" do
    let!(:task) { FactoryGirl.create(:task) }

    it "deletes the task" do
      expect{
        delete :destroy, id: task.id
      }.to change(Task, :count).by(-1)
    end

    it "redirects to :index" do
      delete :destroy, id: task.id
      expect(response).to redirect_to(tasks_path)
    end   
  end  
end