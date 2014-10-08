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
end