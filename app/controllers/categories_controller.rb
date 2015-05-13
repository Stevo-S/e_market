class CategoriesController < ApplicationController
  
  before_action :only_if_logged_in, except: [:index, :show]
  
  def new
    @category = Category.new
  end

  def edit
  end

  def show
  end

  def index
  end

  def update
  end

  def destroy
  end

  def create
    @category = Category.new(category_params)
    
    if @category.save
      flash[:success] = 'New category successfully created'
      redirect_to '/categories/manage'
    else
      flash.now[:danger] = 'Oops. Something went wrong. Could not create new category. Sorry!'
      render 'new'
    end
  end
  
  def manage
    @categories = Category.nested_set.select('id, name, parent_id').all
  end
  
  protected

  def sortable_model
    Category
  end

  def sortable_collection
    "categories"
  end
  
  private
  
  def category_params
    params.require(:category).permit(:name, :parent_id)
  end
end
