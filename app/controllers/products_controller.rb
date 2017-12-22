class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

#crear un nuevo producto, @product, es una nueva instacia de producto
  def new
    @product = Product.new
  end
end
