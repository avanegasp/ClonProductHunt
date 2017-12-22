class ProductsController < ApplicationController

#tiene HTML
  def index
    @products = Product.all
  end

#crear un nuevo producto, @product, es una nueva instacia de producto, tiene HTML
  def new
    @product = Product.new
  end

#ruta almacena y/o guarda el producto y/o registro en la BD,
#cuando el usuario llena el formulario en new, no tiene HTML
  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path, notice:"El producto fue publicado con éxito"
    else
      render :new, notice:"El producto no fue guardado con éxito"
    end
  end

  private
  def product_params
    params.require(:product).permit(:name, :url, :description)
  end
end
