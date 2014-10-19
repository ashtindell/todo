require 'spec_helper'

describe Task do
  before { @task = Task.new(title: "Walk the dog", completed: false, location: "at the park") }

  subject { @task }

  it { should respond_to(:location) }
  it { should respond_to(:due_at) }
  it { should respond_to(:completed) }
  it { should respond_to(:title) }
  it { should be_valid }

  describe "validations" do
    describe "title" do
      context "not present" do
        before { @task.title = " " }
        it { should_not be_valid }
      end

      context "too short" do
        before { @task.title = "a" * 2 }
        it { should_not be_valid }
      end

      context "too long" do
        before { @task.title = "a" * 255 }
        it { should_not be_valid }      
      end

    end

    describe "completed" do
      it "false by default" do
        new_task = Task.new(title: "Any working title")
        expect(new_task.completed).to be_falsey
      end
    end

    describe "due at" do # will fail until we cover hooks
      it "date created by default" do
        new_task = Task.create(title: "Pay electric bill")
        expect(new_task.due_at).to eq(Date.today)
      end

      it "uses selected date if selected" do
        selected_date = 2.weeks.from_now.to_date
        new_task = Task.create(title: "Future task", due_at: selected_date)
        expect(new_task.due_at).to eq(selected_date)
      end
    end


    describe "location" do
      context "not long" do
        before { @task.location = "a" * 255 }
        it { should_not be_valid }
      end

      context "not present" do
        before { @task.location = " " }
        it { should be_valid }
      end
    end
  end
end