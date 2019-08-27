class SubcribersController < ApplicationController
	def index
    @subcribers = Subcriber.all
  end
 
  def show
    @subcriber = Subcriber.find(params[:id])
  end
 
  def new
    @subcriber = Subcriber.new
  end
 
  def edit
    @subcriber = Subcriber.find(params[:id])
  end
 
  def create
    @subcriber = Subcriber.new(subcriber_params)
 
    if @subcriber.save
      redirect_to @subcriber
    else
      render 'new'
    end
  end
 
  def update
    @subcriber = Subcriber.find(params[:id])
 
    if @subcriber.update(subcriber_params)
      redirect_to @subcriber
    else
      render 'edit'
    end
  end
 
  def destroy
    @subcriber = Subcriber.find(params[:id])
    @subcriber.destroy
 
    redirect_to subcribers_path
  end
 
  private
    def subcriber_params
      params.require(:subcriber).permit(:name, :email)
    end
end
