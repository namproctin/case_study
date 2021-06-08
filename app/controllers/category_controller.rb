class CategoryController < ApplicationController
  def index
    tech = Tech.where(name: params[:tech])
    @categories = Category.where(tech: tech)
  end

  def new
  end
end
