class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category.all.order(created_at: :desc)
    render :index
  end

  def new
  end

  def create
  end
end
