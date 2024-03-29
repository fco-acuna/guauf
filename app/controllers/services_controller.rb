class ServicesController < ApplicationController
   def index
    @services = Service.all
  end
  
  def show
    @service = Service.find(params[:id])
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(service_params)
    @service.walker = current_user.walker
    if @service.save
      redirect_to walkers_path, notice: 'El servicio fue creado exitosamente.'
    else
      render :new
    end
  end

  def edit
    @service = Service.find(params[:id])
  end
  def update
    @service = Service.find(params[:id])
    if @service.update(service_params)
      redirect_to walkers_path, notice: 'El servicio fue actualizado exitosamente.'
    else
      render :edit
    end
  end

  def destroy
    @service = Service.find(params[:id])
    @service.destroy
    redirect_to services_url, notice: 'El servicio fue eliminado exitosamente.'
  end

  private

  def service_params
    params.require(:service).permit(:walking_time, :price, :distance, :user_id)
  end
end
