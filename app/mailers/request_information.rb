class RequestInformation < ActionMailer::Base
   def request_information(request_info)  
   	 #@request_info = request_info
     mail(:to => "joseph.stevenson82@gmail.com", :subject => "Requesting info", :from => "request_information@SCPEdesign.com" )  
   end 
end
