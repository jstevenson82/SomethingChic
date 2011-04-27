class RequestInformationController < ApplicationController
   
  def index
      render :template => '/request_information/index'
  end
   
  def sendmail  
     request_info = params[:request] 
     
     respond_to do |format|  
         RequestInformation.request_information(request_info).deliver  
         format.html { redirect_to(:request, :notice => 'Request successfully sent!') }  
     end  
  end 
  
end
