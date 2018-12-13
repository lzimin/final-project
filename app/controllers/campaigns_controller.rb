class CampaignsController < ApplicationController
  def index
    @campaigns = Campaign.all
    @my_company_campaigns = Campaign.where(:company_id => current_user.company_id)
    
    render("campaign_templates/index.html.erb")
  end

  def show
    @campaign = Campaign.find(params.fetch("id_to_display"))
   
    @status = ["Active", "Approved", "Awaiting Approval", "Expired"]
    
    @alert_type = ["success", "warning", "primary", "secondary"]
        if @campaign.status == "Active"
          @alert_type = "primary"
          
        elsif @campaign.status == "Approved"
          @alert_type = "success"
          
        elsif @campaign.status == "Awaiting Approval"
          @alert_type = "warning"
          
        else
          @alert_type = "secondary"
        end
        
    @flows = Flow.where(:campaign_id => @campaign.id)
    @sorted_flows = @flows.sort
    
    @all_flows = Flow.where(:campaign_id => @campaign.id).all    
    @latest_flow = Flow.where(:campaign_id => @campaign.id).last


    

    render("campaign_templates/show.html.erb")
  end

  def new_form
    @campaign = Campaign.new
    
    render("campaign_templates/new_form.html.erb")
  end

  def create_row
    @campaign = Campaign.new

    @campaign.company_id = params.fetch("company_id")
    @campaign.campaign_title = params.fetch("campaign_title")
    @campaign.campaign_start = params.fetch("campaign_start")
    @campaign.campaign_end = params.fetch("campaign_end")
    @campaign.creator_id = params.fetch("creator_id")
    @campaign.last_updater_id = params.fetch("last_updater_id")
    @campaign.campaign_description = params.fetch("campaign_description")
    @campaign.status = params.fetch("status")

    if @campaign.valid?
      @campaign.save

      redirect_to("/campaigns", :notice => "Campaign created successfully.")
    else
      render("campaign_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @campaign = Campaign.find(params.fetch("prefill_with_id"))

    render("campaign_templates/edit_form.html.erb")
  end

  def update_row
    @campaign = Campaign.find(params.fetch("id_to_modify"))

    @campaign.company_id = params.fetch("company_id")
    @campaign.campaign_title = params.fetch("campaign_title")
    @campaign.campaign_start = params.fetch("campaign_start")
    @campaign.campaign_end = params.fetch("campaign_end")
    @campaign.creator_id = params.fetch("creator_id")
    @campaign.last_updater_id = params.fetch("last_updater_id")
    @campaign.campaign_description = params.fetch("campaign_description")
    @campaign.status = params.fetch("status")

    if @campaign.valid?
      @campaign.save

      redirect_to("/campaigns/#{@campaign.id}", :notice => "Campaign updated successfully.")
    else
      render("campaign_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @campaign = Campaign.find(params.fetch("id_to_remove"))

    @campaign.destroy

    redirect_to("/campaigns", :notice => "Campaign deleted successfully.")
  end
end
