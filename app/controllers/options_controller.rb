class OptionsController < ApplicationController
  belongs_to :device
  respond_to :html, :xml, :json, :js
  actions :show, :new, :create, :edit, :index

  def new
    @device = Device.find(params[:device_id])
    new!
  end
end