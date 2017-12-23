class ProductsController < ApplicationController
#el @ es solo si necesitamos mostrar en una vista
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

  #se comienza con la misma línea de show y edit,#ahora se almacena en la BD
  #si devuelve verdadero, redireccionamos,si devuelve falso que vaya a edit
  def update
    product = Product.find(params[:id])
    if product.update(product_params)
      redirect_to products_path, notice: "El producto ha sido modificado con éxito"
    else
      render :edit
    end
  end

  def destroy
    product = Product.find(params[:id])
    #eliminamos el producto
    product.destroy
    redirect_to products_path, notice: "El producto fue eliminado con éxito"
  end

#nos permite almacenar la información que nos llega en el formulario
  private
  def product_params
    params.require(:product).permit(:name, :url, :description)
  end
end
