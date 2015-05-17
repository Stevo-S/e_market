class ProductsController < ApplicationController
  
  before_action :only_if_logged_in, except: [:index, :show]
  
  def new
    @product = Product.new
    @locations = Location.roots
  end
  
  def update_locations
    @product = Product.new
    @location = Location.find_by_id(params[:product][:location_id])
    @locations = @location.children
    if @locations.empty?
      render nothing: true
    else
      render partial: 'locations'
    end
  end

  def create
    @product = current_user.products.build(product_params)
    
    if @product.save
      flash[:success] = 'Post was successful!'
      redirect_to @product
    else
      flash.now[:danger] = 'Whoopsiedaisy. Something went wrong. Post FAILED!'
      render 'new'
    end
  end

  def edit
  end

  def destroy
  end

  def show
    @product = Product.find_by_id(params[:id])
  end

  def index
    
    respond_to do |format|
      if params[:location] 
        @location = Location.find(params[:location]) 
        @locations = @location.children
      else
        @locations = Location.roots
      end

      if @location
        @products = Product.where location_id: @location.descendants.ids
      else
        @products = Product.all
      end
      
      format.html 
      format.js { render partial: 'index'}
    end
  end

  def update
  end
  
  private
  
  def product_params
    params.require(:product).permit(:product_name, :price, :description, :picture, :category_id, :location_id)
  end
end
