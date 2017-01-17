class ProjectMailer < ApplicationMailer	 
  def sample_email(current_user,client)
    @user = client
    mail(from: current_user.email, to: client.email, subject: 'Sample Email')
  end
end
