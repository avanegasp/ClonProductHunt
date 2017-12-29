class VotesController < ApplicationController
#votar por un producto, en la línea 2 y 11 obtenemos el producto
    def create
    product = Product.find(params[:product_id])
    product.votes.create(user: current_user)

    redirect_to root_path
  end

  def destroy
    product = Product.find(params[:product_id])
    product.votes.where(user: current_user).take.try(:destroy)

    redirect_to root_path
  end
end
