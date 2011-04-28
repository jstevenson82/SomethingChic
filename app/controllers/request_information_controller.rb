class RequestInformationController < ApplicationController
   
  def index
      render :template => '/request_information/index'
  end
   
  def sendmail  
     @request_info = Request.new(params[:request])
     
     respond_to do |format|  
         RequestInformation.request_information(@request_info).deliver  
         RequestInformation.request_information_ack(@request_info).deliver  
         format.html { redirect_to(:home, :notice => 'Request successfully sent!') }  
     end  
  end 
  
end
