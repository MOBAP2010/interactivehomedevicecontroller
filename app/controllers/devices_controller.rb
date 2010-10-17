class DevicesController < ApplicationController
  respond_to :html, :xml, :json, :js
  actions :index, :show, :new, :create, :edit, :destroy, :update

  def index
    @devices = Device.paginate :page => params[:page], :per_page => 5, :order => 'created_at DESC'

    index!
  end
end
