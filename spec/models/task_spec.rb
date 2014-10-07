require 'spec_helper'

describe Task do
  before { @task = Task.new(title: "Walk the dog", completed: true, location: "at the park") }

  subject { @task }

  it { should respond_to(:location) }
  it { should respond_to(:due_at) }
  it { should respond_to(:completed) }
  it { should respond_to(:title) }
  it { should be_valid }

  describe "validations" do
    describe "title" do
      describe "not present" do
        before { @task.title = " " }
        it { should_not be_valid }
      end

      describe "too short" do
        before { @task.title = "a" * 2 }
        it { should_not be_valid }
      end

      describe "too long" do
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

    describe "due at" do
      it "today's date by default" do
        new_task = Task.new(title: "Pay electric bill")
        expect(new_task.due_at).to eq(Date.today)
      end
    end

    describe "location" do
      describe "not long" do
        before { @task.location = "a" * 255 }
        it { should_not be_valid }
      end

      describe "not present" do
        before { @task.location = " " }
        it { should be_valid }
      end
    end
  end
end











      # describe "incorrect format" do
      #   it "is not valid" do
      #     invalid_titles = ["$$$$$$", "abc $#@!@%"]
      #     invalid_titles.each do |invalid_title|
      #       @task.title = invalid_title
      #       expect(@task).not_to be_valid
      #     end
      #   end
      # end