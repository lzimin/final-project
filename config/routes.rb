Rails.application.routes.draw do
  # Routes for the Flow approval resource:
  
  devise_for :users
  
  root "campaigns#index"

  # CREATE
  get("/flow_approvals/new", { :controller => "flow_approvals", :action => "new_form" })
  post("/create_flow_approval", { :controller => "flow_approvals", :action => "create_row" })

  # READ
  get("/flow_approvals", { :controller => "flow_approvals", :action => "index" })
  get("/flow_approvals/:id_to_display", { :controller => "flow_approvals", :action => "show" })

  # UPDATE
  get("/flow_approvals/:prefill_with_id/edit", { :controller => "flow_approvals", :action => "edit_form" })
  post("/update_flow_approval/:id_to_modify", { :controller => "flow_approvals", :action => "update_row" })

  # DELETE
  get("/delete_flow_approval/:id_to_remove", { :controller => "flow_approvals", :action => "destroy_row" })

  #------------------------------

  # Routes for the Flow Comment resource:

  # CREATE
  get("/flow_comments/new", { :controller => "flow_comments", :action => "new_form" })
  post("/create_flow_comment", { :controller => "flow_comments", :action => "create_row" })

  # READ
  get("/flow_comments", { :controller => "flow_comments", :action => "index" })
  get("/flow_comments/:id_to_display", { :controller => "flow_comments", :action => "show" })

  # UPDATE
  get("/flow_comments/:prefill_with_id/edit", { :controller => "flow_comments", :action => "edit_form" })
  post("/update_flow_comment/:id_to_modify", { :controller => "flow_comments", :action => "update_row" })

  # DELETE
  get("/delete_flow_comment/:id_to_remove", { :controller => "flow_comments", :action => "destroy_row" })

  #------------------------------

  # Routes for the Flow resource:

  # CREATE
  get("/flows/new", { :controller => "flows", :action => "new_form" })
  post("/create_flow", { :controller => "flows", :action => "create_row" })

  # READ
  get("/flows", { :controller => "flows", :action => "index" })
  get("/flows/:id_to_display", { :controller => "flows", :action => "show" })

  # UPDATE
  get("/flows/:prefill_with_id/edit", { :controller => "flows", :action => "edit_form" })
  post("/update_flow/:id_to_modify", { :controller => "flows", :action => "update_row" })

  # DELETE
  get("/delete_flow/:id_to_remove", { :controller => "flows", :action => "destroy_row" })

  #------------------------------

  # Routes for the Company resource:

  # CREATE
  get("/companies/new", { :controller => "companies", :action => "new_form" })
  post("/create_company", { :controller => "companies", :action => "create_row" })

  # READ
  get("/companies", { :controller => "companies", :action => "index" })
  get("/companies/:id_to_display", { :controller => "companies", :action => "show" })

  # UPDATE
  get("/companies/:prefill_with_id/edit", { :controller => "companies", :action => "edit_form" })
  post("/update_company/:id_to_modify", { :controller => "companies", :action => "update_row" })

  # DELETE
  get("/delete_company/:id_to_remove", { :controller => "companies", :action => "destroy_row" })

  #------------------------------

  # Routes for the Campaign resource:

  # CREATE
  get("/campaigns/new", { :controller => "campaigns", :action => "new_form" })
  post("/create_campaign", { :controller => "campaigns", :action => "create_row" })

  # READ
  get("/campaigns", { :controller => "campaigns", :action => "index" })
  get("/campaigns/:id_to_display", { :controller => "campaigns", :action => "show" })

  # UPDATE
  get("/campaigns/:prefill_with_id/edit", { :controller => "campaigns", :action => "edit_form" })
  post("/update_campaign/:id_to_modify", { :controller => "campaigns", :action => "update_row" })
  post("/campaigns/update_campaign/:id_to_modify", { :controller => "campaigns", :action => "update_row" })
  
  # DELETE
  get("/delete_campaign/:id_to_remove", { :controller => "campaigns", :action => "destroy_row" })

  #------------------------------


  # Routes for the Users display:
  # READ
  get("/users", { :controller => "viewusers", :action => "index" })
  get("/users/:id_to_display", { :controller => "viewusers", :action => "show" })
  
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
