class KittensController < ApplicationController

  def new
    @kitten = Kitten.new
  end

  def show
    @kitten = Kitten.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @kitten}
    end
  end

  def index
    @kittens = Kitten.all
    respond_to do |format|
      format.html
      format.json { render json: @kittens}
    end
  end

  def update
    @kitten = Kitten.find(params[:id])
    if @kitten.update_attributes(kittens_params)
      flash[:success] = " Kitten updated"
      redirect_to @kitten
    else
      render 'edit'
    end
  end

  def destroy
     Kitten.find(params[:id]).destroy
     flash[:info] = "Kitten deleted"
    redirect_to root_url
  end

  def create
    @kitten = Kitten.new(kittens_params)
    if @kitten.save
      flash[:success] = "Kitten created"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def kittens_params
    params.require(:kitten).permit(:name, :age, :softness, :cuteness)
  end

end
