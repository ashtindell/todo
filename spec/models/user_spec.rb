# Users can sign up for the site with a valid name and email
require 'spec_helper'

describe User do 
  before { @user = User.new(name: "Ashley Tindell", email: "tindell.ea@gmail.com") }

  subject { @user } 

  it { should respond_to(:name) }
     { should respond_to(:email) }
     { should be_valid }

  describe "validations" do
    describe "name" do
     context "not present" do
      before { @user.name = " " }
      it { should_not be_valid }
     end
    
     context "too long" do
      before { @user.name = "a" * 51 }
      it { should_not be_valid }
     end
    end
    
    describe "email" do
      context "not present" do
      end
    
      context "too long" do
      end
    
      context "correct format" do
        it "is valid" do
          addresses = %w[]
          addresses.each do |valid_address|
            @user.email = valid_address
            expect(@user).to be_valid
          end
        end
      end

      context "incorrect format" do
        see above
      end

      context "mixed case" do
        it "is saved as lowercase" do
          mixed_case_email = tinDeLl.eA@gmaiL.cOm
          @user.email = mixed_case_email
          @user.save
          expect(@user.reload.email).to eq mixed_case_email.downcase
        end
      end

      context "when already taken" do
        before do
          user_with_same_email = @user.dup
          user_with_same_email.save
        end

        it { should_not be_valid }
      end
    end
  end
end