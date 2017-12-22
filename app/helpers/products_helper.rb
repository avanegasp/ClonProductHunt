module ProductsHelper
  def form_title
    @product.new_record? ? "Publicar Producto" : "Editar Producto"
  end
end
