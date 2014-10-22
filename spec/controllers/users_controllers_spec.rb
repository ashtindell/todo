require 'spec_helper'

describe UsersController, type: :controller do
  describe "GET new" do
    it "renders :new" do
      get :new
      expect(response).to render_template(:new)
    end
    it "assigns new User to @user" do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe "POST create user" do
    context "valid attributes" do
      it "creates user" do
        expect{
          post :create, user: FactoryGirl.attributes_for(:user)
        }.to change(User, :count).by(1)
      end
      it  "redirects to :show" do
        post :create, user: FactoryGirl.attributes_for(:user)
        last_user = User.last
        expect(response).to redirect_to(user_path(last_user.id))
      end
    end

    context "invalid attributes" do
      it "does not create user" do
        expect{
        post :create, user: FactoryGirl.attributes_for(:user, email: " ")
        }.to_not change(User, :count)
      end
      it "re-renders :new" do
        post :create, user: FactoryGirl.attributes_for(:user, email: " ")
        expect(response).to render_template(:new)
      end
    end
  end

  describe "GET show" do
    let(:user) { FactoryGirl.create(:user) }

    it "renders :show page" do
      get :show, id: user.id
      expect(response).to render_template(:show)
    end

    it "assigns requested user to @user" do
      get :show, id: user.id
      expect(assigns(:user)).to eq(user)
    end
  end

  describe "GET new" do
    it "assigns new user to @user" do
      get :new
      expect(assigns(:user)).to be_a_new(User) # confirm that @user = User.new
    end
    it "renders :new" do
      get :new
      expect(response).to render_template(:new)
    end
  end
end