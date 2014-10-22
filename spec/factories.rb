FactoryGirl.define do
  factory :task do
    title       "Walk the dog"
    completed   false
    location    "at the park"
    due_at      Date.today
  end

  sequence :name do |n|
    "Name-#{n}"
  end

  sequence :email do |n|
    "email-#{n}@email.com"
  end

  factory :user do
    name
    email
    password              "foobar"
    password_confirmation "foobar"
  end
end



# whereever I have the following code:
# let(:task) { Task.create(title: "Walk Molly", due_at: "2014-10-11") }
# change it to: 
# let(:task) { FactoryGirl.create(:task) }
# look out for the update test spec 
# You could also overwrite what's in Factory Girl by typing:
# { FactoryGirl.create(:task, title: "Do the dishes") }