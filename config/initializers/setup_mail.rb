 ActionMailer::Base.smtp_settings = {  
   :address              => "smtp.gmail.com",  
   :port                 => 587,  
   :domain               => "no-reply@SCPEdesign.com",  
   :user_name      		 => 'joseph.stevenson82',
   :password       		 => 'n0limit1',  
   :authentication       => "plain",  
   :enable_starttls_auto => true  
 }