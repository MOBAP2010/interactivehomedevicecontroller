class DevicesController < ApplicationController
  respond_to :html, :xml, :json
  actions :index, :show, :new, :create, :edit

  def index
    @devices = Device.paginate :page => params[:page], :per_page => 5, :order => 'created_at DESC'

    index!
  end
end
