# 1. Create a GET tasks#show page when the user visits /tasks/:id     (aka visits /tasks/3)

require 'spec_helper'

describe TasksController, type: :controller do 
  describe "GET show" do
    before { @task = Task.create(title: "Walk Molly", due_at: "2014-10-11") }

    it "renders show page" do
      get :show, id: @task.id
      expect(response).to render_template(:show)
    end

    it "assigns requested task to @task" do
      get :show, id: @task.id
      # Expect @task to be set to the task we're looking for
      assigns(:task).should eq(@task)
    end
    # @task = Task.find(params[:id])
    # When we go to /tasks/3
    # Right side of equal sign --> Task.find(3) ==> {id: 3, title: "Walk Molly", created_at: "etc..."}
  end

  describe "GET new" do
    it "assigns new task to @task"
    it "renders new task page"
  end

  describe "GET edit task" do
    it "edits task assigned to @task"
    it "renders edit task page"
  end

  describe "GET index" do
    it "populates an array of tasks"
    it "renders index page"
  end

  describe "POST create task" do
    context "with valid attributes" do
      it "creates a new task"
      it "redirects to tasks index"
    end

    context "with invalid attributes" do
      it "doesn't create a new task"
      it "re-renders the new task page"
    end
  end

  describe "PUT update task" do
    context "with valid attributes" do
      it "locates the requested @task"
      it "changes the task's attributes"
      it "redirects to the updated task"
    end

    context "with invalid attributes" do
      it "locates the requested @task"
      it "doesn't change the task's attributes"
      it "re-renders the edit task page"
    end    
  end

  describe "DELETE destroy" do
    it "deletes the contact"
    it "redirects to tasks#index"
  end  
end