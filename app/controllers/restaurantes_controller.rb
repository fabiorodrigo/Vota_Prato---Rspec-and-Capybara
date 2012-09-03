class RestaurantesController < ApplicationController
 respond_to :html, :js
 
 def index
	@restaurantes = Restaurante.order("nome")
	respond_with @restaurante
 end

 def show
   @restaurante = Restaurante.find(params[:id])
   respond_with @restaurante
 end

 def new
   @restaurante = Restaurante.new
   respond_with @restaurante
 end

 def create
   @restaurante = Restaurante.new(params[:restaurante])
   if @restaurante.save
      redirect_to(action: "show", id: @restaurante)
   else
     render action: "new"
   end
 end

 def edit
   @restaurante = Restaurante.find(params[:id])
 end
  
  def update
   @restaurante = Restaurante.find(params[:id])
   if @restaurante.update_attributes(params[:restaurante])
      redirect_to(action: "show", id: @restaurante)
   else
     render action: "edit"
   end
  end
  
  def destroy
    @restaurante = Restaurante.find(params[:id])
    @restaurante.destroy    
	respond_with @restaurante
  end
end