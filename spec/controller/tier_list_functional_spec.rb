require "rails_helper"
RSpec.describe TierListsController, :type => :controller do
    describe "test web requests" do
        let(:valid_attributes) {
            { :name => "Test name!", :description => "This is a test description", :numTiers => 3 }
        }
        let(:valid_session) { {} }

        context "GET #index" do
            it "returns a success response" do
            get :index
            expect(response).to have_http_status(:ok)
            end
        end

        context "GET #create" do
            # This should return the minimal set of attributes required to create a valid

            describe "GET #create" do
                it "returns a success response" do
                    TierList.create! valid_attributes
                    get :index, params: {}, session: valid_session
                    expect(response).to have_http_status(:ok)
                end
            end


        end

        context "GET #show" do
            let!(:tier_list) { TierList.create(name: "Test name", description: "Test description", numTiers: 4) }
            it "returns a success response" do
                expect(response).to have_http_status(:ok)
            end
        end        

        context "GET #new" do
            let!(:tier_list) { TierList.new }
            it "returns a success response" do
                expect(response).to have_http_status(:ok)
            end
        end
        
        context "PATCH/PUT #update" do
        let!(:tier_list) { 
            tier_list = TierList.create(name: "Test name", description: "Test description")
            tier_list.update(name: "new", description: "Test description2")
         }
            it "returns a success response" do
                expect(response).to have_http_status(:ok)
            end
        end
    end
end
