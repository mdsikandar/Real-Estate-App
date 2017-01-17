class PropertiesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @properties = Property.all
    end
  def show
    @property = Property.find(params[:id])
    end
  def new
     @property = current_user.properties.build
  end
  def edit
      @property = Property.find(params[:id])
  end
  def create
      @property = current_user.properties.build(property_params)
    if @property.save
      redirect_to properties_path
    else
      render :new
    end
  end
  def update
    @property = Property.find(params[:id])
      if @property.update(property_params)
        redirect_to @property
      else
      render 'edit'
      end
  end
  def destroy
    @property = Property.find(params[:id])
    if  @property.destroy
      redirect_to properties_path, notice: "Successfully destroyed"
    else
      redirect_to @property, notice: "Not destroyed"
    end
  end
  private
    def property_params
      params.require(:property).permit(:name,:user_id)
    end
end

