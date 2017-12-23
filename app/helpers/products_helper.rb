module ProductsHelper
  def form_title
    @product.new_record? ? "Nuevo Producto" : "Modificar Producto"
  end
end
