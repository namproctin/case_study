class ProjectController < ApplicationController
  def index
    category = Category.where(name: params[:category])
    @projects = Project.where(category: category)
  end

  def new
    
  end

  def create_project
    tech_name = params[:tech]
    tech = Tech.where("lower(name) = ?", tech_name.downcase)&.first
    tech = Tech.create(name: tech_name) if tech.nil?

    category_name = params[:category]
    category = Category.where("lower(name) = ?", category_name.downcase)&.first
    if category.nil? || (category.present? && tech != category.tech )
      category = Category.create(name: category_name, tech: tech) 
    end

    p = Project.create(url: params[:url], category: category)
    if p.valid? && category.valid? && tech.valid? 
      flash[:success] = "A new project was created"
    else 
      flash[:error] = p.errors.full_messages + category.errors.full_messages + tech.errors.full_messages
    end 
    redirect_to root_path
  end
end
