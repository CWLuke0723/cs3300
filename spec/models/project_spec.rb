require "rails_helper"

RSpec.describe Project, type: :model do
    context "validation tests" do
        it "ensures the description is present" do
            project = Project.new(description: "Content of the description")
            expect(project.valid?).to eq(false)
        end

        it "should be able to save project" do
            project = Project.new(title: "Title", description: "Some description content goes here")
            expect(project.save).to eq(true)
        end

        #Tests if project must have a description
        it "should have a description" do
            project = Project.new(title: "Title", description: nil)
            expect(project.save).to eq(false)
        end
    end

    context "scopes tests" do
        let(:params) { { title: "Title", description: "some description" } }
        before(:each) do
            Project.create(params)
            Project.create(params)
            Project.create(params)
        end

        it "should return all projects" do
            expect(Project.count).to eq(3)
        end
    end
end