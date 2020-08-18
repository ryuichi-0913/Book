class ListsController < ApplicationController

  def top
  end

  def create
  	@list = List.new(list_params)
   if @list.save
 	# flash[:notice] = 'successfully create'
  	redirect_to list_path(@list), notice: 'successfully create'
   else
   	@lists = List.all
       render action: :index
   end
  end

  def index
  	@lists = List.all
    @list = List.new
  end

  def show
  	@list = List.find(params[:id])
  end

  def edit
  	@list = List.find(params[:id])
  end

  def update
  	@list = List.find(params[:id])
   if @list.update(list_params)
  	redirect_to list_path(@list.id), notice: 'successfully update'
   else
   	render action: :edit
   end
  end

  def destroy
  	list = List.find(params[:id])
  	list.destroy
  	redirect_to lists_path

  end


  private
  def list_params
  	params.require(:list).permit(:title, :body)
  end
end