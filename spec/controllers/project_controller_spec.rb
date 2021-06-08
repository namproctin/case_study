RSpec.describe ProjectController, :type => :request do
  describe "successfully create a new project" do
    it "creates a new project and read project infos" do
      post "/create_project", :params => { :tech => "Scala", category: "web dev", url: "https://github.com/playframework/playframework" }
      expect(Tech.count).to eq 1
      expect(Category.count).to eq 1
      expect(Project.count).to eq 1

      p = Project.last 
      expect(p.stars).to be_present
      expect(p.forks).to be_present
      expect(p.last_update).to be_present

      post "/create_project", :params => { :tech => "Frontend", category: "javascript", url: "https://github.com/jquery/jquery" }
      post "/create_project", :params => { :tech => "Frontend", category: "javascript", url: "https://github.com/twbs/bootstrap" }
      post "/create_project", :params => { :tech => "Frontend", category: "javascript", url: "https://github.com/mui-org/material-ui" }
      
      expect(Tech.count).to eq 2
      expect(Category.count).to eq 2
      expect(Project.count).to eq 4

      get "/Frontend/javascript"
      expect(@controller.view_assigns["projects"].count).to eq 3
    end

    it "doesn't create a new project with missing params" do 
      expect(Project.count).to eq 0
      post "/create_project", :params => { :tech => "Scala", category: "web dev", url: "" }
      expect(flash[:error]).to be_present
      expect(Project.count).to eq 0
    end 
  end
end