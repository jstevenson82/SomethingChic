class ServicesController < ApplicationController

  layout "services"

  def index
    @services = Service.all
    @services = @services.paginate(:page => params[:page], :per_page => 10)

    respond_to do |format|
      format.html # index.html.erb
    end
  end

end
