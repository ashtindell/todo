require 'spec_helper'

describe "tasks_pages" do 

  subject { page }

  describe "show page GET /tasks/:id" do
    let(:my_task) { Task.create(title: "Do the dishes") }
    # Visit the show page /tasks/1 -- a single task
    before { visit show_task_path(my_task.id) }
    # Will see if the title is set correctly
    it { should have_title("Todo | Show Task") }
    # Will see if the headers are set correctly
    it { should have_selector('h1', "I need to...") }
    it { should have_selector('p', my_task.title) }
  end
end