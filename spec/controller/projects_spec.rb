require "rails_helper"

RSpec.describe ProjectsController, type: :controller do
  #Tests if the index page is receiving its information correctly
  context "GET #index" do
    it "returns a success response" do
      get :index
      # expect(response.success).to eq(true)
      expect(response).to be_success
    end
  end

  #Tests if the projects retrieve their information correctly
  context "GET #show" do
    let!(:project) { Project.create(title: "Test title", description: "Test description") }
    it "returns a success response" do
      get :show, params: { id: project }
      expect(response).to be_success
    end
  end
end