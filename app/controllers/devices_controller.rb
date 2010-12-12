class DevicesController < ApplicationController
  respond_to :html, :xml, :json, :js
  actions :index, :show, :new, :create, :edit, :destroy, :update

  def index
    @devices = Device.all #paginate :page => params[:page], :per_page => 5, :order => 'created_at DESC' 

    index!
  end

  def power
    @device = Device.find(params[:device_id])
    @device.power = (@device.power ? false : true)
    @device.save!
    render :show
  end
end
