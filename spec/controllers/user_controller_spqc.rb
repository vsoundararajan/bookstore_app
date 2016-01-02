require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  describe "GET #index" do
    it "returns a successful http request status code" do
      get :index

      expect(response).to have_http_status(:success)
    end
  end

  describe "Get #show" do 
    it "returns a successful http status code" do
      user = Fabricate(:user)

      get :show, id: user.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
   it "returns a successful http request code" do
    get :new
    expect(response).to have_http_status(:success)
   end
  end

  describe "POST #create" do
    context "a successful create" do
      it "save the new user object" do
        post :create, user: Fabricate.attributes_for(:user)
        expect(User.count).to eq(1)
      end

      it "redirects to the user show action" do
        post :create, user: Fabricate.attributes_for(:user)
        expect(response).to redirect_to user_path(User.last)
      end

      it "sets the success flash message" do
        post :create, user: Fabricate.attributes_for(:user)
        expect(flash[:success]).to eq("User has been created")
      end
    end

    context "an unsuccessful create" do
      it "does not save the user object with invalid inputs" do
        post :create, user: Fabricate.attributes_for(:user, first_name: nil)

        expect(User.count).to eq(0)
      end

      it "sets the failure flash message" do
        post :create, user: Fabricate.attributes_for(:user, first_name: nil)

        expect(flash[:danger]).to eq("User has not been created")
      end
    end
  end


  describe "GET #edit" do
    let(:user) {Fabricate(:user)}
    it "sends a successful edit request" do
      get :edit, id: user

      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT #update" do
    context "Successful update" do
       let(:john) {Fabricate(:user, first_name: "John")}

       it "updates the modified user object" do
         put :update, user: Fabricate.attributes_for(:user, first_name: "Mike"), id: john.id

         expect(User.last.first_name).to eq("Mike")
         expect(User.last.first_name).not_to eq("John")
       end

       it "sets the success user object" do
         put :update, user: Fabricate.attributes_for(:user, first_name: "Mike"), id: john.id

         expect(flash[:success]).to eq("User has been updated")
       end

       it "it redirects to the show action" do
         put :update, user: Fabricate.attributes_for(:user, first_name: "Mike"), id: john.id

         expect(response).to redirect_to(user_path(User.last))

       end


    end

    context "Unsuccessful update" do
      let(:john) {Fabricate(:user, first_name: "John")}

       it "does not updates the user object with invalid inputs" do
         put :update, user: Fabricate.attributes_for(:user, first_name: nil), id: john.id

         expect(User.last.first_name).to eq("John")
       end

       it "sets the failure flash message" do
         put :update, user: Fabricate.attributes_for(:user, first_name: nil), id: john.id

         expect(flash[:danger]).to eq("User has not been updated")
       end
    
    end

  end


  describe "DELETE #destroy" do
      let(:user) {Fabricate(:user)}

      it "deletes the user with the given id" do
         delete :destroy, id: user.id

         expect(User.count).to eq(0)
      end

      it "sets the flash message" do
         delete :destroy, id: user.id

         expect(flash[:success]).to eq("User has been deleted")
      end

      it "redirects to the index action" do
         delete :destroy, id: user.id

         expect(response).to redirect_to users_path
      end
  end

end