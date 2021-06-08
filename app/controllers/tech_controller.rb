class TechController < ApplicationController
  def index
    @techs = Tech.all
  end

  def new
  end
end
