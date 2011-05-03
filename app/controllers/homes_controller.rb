class HomesController < ApplicationController

  layout "home"

  def index
    @homes = Home.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @homes }
    end
  end
  
end
