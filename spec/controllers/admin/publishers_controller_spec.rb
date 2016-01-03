require 'rails_helper'

RSpec.describe Admin::PublishersController, :type => :controller do
  describe "GET #index" do
    it "returns a successful http request status code" do
      get :index

      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it  "returns a successful http status code" do
     publisher = Fabricate(:publisher)

     get :show, id: publisher.id
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
      it "save a new publisher object" do
        post :create, publisher: Fabricate.attributes_for(:publisher)
        expect(Publisher.count).to eq(1)
      end

      it "redirects to the publisher show action" do
        post :create, publisher: Fabricate.attributes_for(:publisher)
        expect(response).to redirect_to publisher_path(Publisher.last)
      end

      it "sets the success flash message" do 
        post :create, publisher: Fabricate.attributes_for(:publisher)
        expect(flash[:success]).to eq("Publisher has been created")
      end

    end


    context "an unsuccessful create" do
      
      it "does not save the publisher object with invalid inputs" do
        post :create, publisher: Fabricate.attributes_for(:publisher, name: nil)
        expect(Publisher.count).to eq(0)
      end

      it "sets the failure flash message" do
        post :create, publisher: Fabricate.attributes_for(:publisher, name: nil)
        expect(flash[:danger]).to eq("Publishere has not been created")
      end

      it "does not save the publisher object with duplicate name input" do
        post :create, publisher: Fabricate.attributes_for(:publisher, name: "Packt")
        post :create, publisher: Fabricate.attributes_for(:publisher, name: "Packt")
        expect(Publisher.count).to eq(1)
        expect(flash[:danger]).to eq("Publishere has not been created")
      end

    end

  end

  describe "DELETE #destroy" do

    context "successful deletion" do
        let(:publisher) {Fabricate(:publisher)}
        
        it "deletes the publisher with given id" do
          delete :destroy, id: publisher.id

          expect(Publisher.count).to eq(0)
        end

        it "sets the flash message" do
          delete :destroy, id: publisher.id

          expect(flash[:success]).to eq("Publisher has been deleted")
        end

        it "redirects to the index action" do
          delete :destroy, id: publisher.id

          expect(response).to redirect_to publishers_path
        end
    end
 
    context "unsuccessful deletion" do

        it " does not deletes the publisher with non existing id" do
          delete :destroy, id: 999999

          expect(flash[:danger]).to eq("Publisher could not be found")
        end

    end

  end
end
