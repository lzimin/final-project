class ViewusersController < ApplicationController

  def index
    @users = User.all
    @my_colleagues = User.where(:company_id => current_user.company_id)
    @ff_colleagues = User.where(:company_id => "1")
    render("user_templates/index.html.erb")
  end
  
  def show
    @user = User.find(params.fetch("id_to_display"))
  
    render("user_templates/show.html.erb")
  end  

end