class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # Create
  def new
  end

  def create
  end

  # Read
  def index
  	@products = Product.all
  end

  def show
  	@product = Product.find(params[:id])
  end

  # Update
  def edit
  	@product = Product.find(params[:id])
  end

  def update
  end

  # Destroy
  def destroy
  end

  private 

    def set_product
      @product = Product.find(params[:id])
    end  

    def product_params
      params.require(:product).permit(:title, :description, :image_url, :price)
    end

end
