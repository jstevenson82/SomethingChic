class RequestInformation < ActionMailer::Base
   def request_information(request_info)  
   	 @request_info = request_info
     mail(:to => "joseph.stevenson82@gmail.com,chrichta@yahoo.com", :subject => "Requesting info", :from => "request_information@SCPEdesign.com" )  
   end 
   
   def request_information_ack(request_info)  
   	 @request_info = request_info
     mail(:to => @request_info.email, :subject => "Information request recevied", :from => "non-reply@SCPEdesign.com" )  
   end 
end
