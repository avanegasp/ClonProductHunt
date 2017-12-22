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

#obtenemos el producto (el el id) para el cuál vamos a mostrar los detalles,
#tiene HTML
  def show
    @product = Product.find(params[:id])
  end
  
#es exactamente igual a show, en la vista, va acontener el formulario que nos
#va a permitir editar un producto (es casí el mismo formulario de new.html.erb)
  def edit
    @product = Product.find(params[:id])
  end

  private
  def product_params
    params.require(:product).permit(:name, :url, :description)
  end
end
