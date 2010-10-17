class OptionsController < ApplicationController
  respond_to :html, :xml, :json, :js
  actions :show, :new, :create, :edit

  def new
    @device = Device.find(params[:device_id])
    new!
  end
end