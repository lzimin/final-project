class FlowsController < ApplicationController
  def index
    @flows = Flow.all

    render("flow_templates/index.html.erb")
  end

  def show
    @flow = Flow.find(params.fetch("id_to_display"))

    render("flow_templates/show.html.erb")
  end

  def new_form
    @flow = Flow.new

    render("flow_templates/new_form.html.erb")
  end

  def create_row
    @flow = Flow.new

    @flow.campaign_id = params.fetch("campaign_id")
    @flow.flow_version = params.fetch("flow_version")
    @flow.flow_image = params.fetch("flow_image")
    @flow.creator_id = params.fetch("creator_id")

    if @flow.valid?
      @flow.save

      redirect_to("/flows", :notice => "Flow created successfully.")
    else
      render("flow_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @flow = Flow.find(params.fetch("prefill_with_id"))

    render("flow_templates/edit_form.html.erb")
  end

  def update_row
    @flow = Flow.find(params.fetch("id_to_modify"))

    @flow.campaign_id = params.fetch("campaign_id")
    @flow.flow_version = params.fetch("flow_version")
    @flow.flow_image = params.fetch("flow_image")
    @flow.creator_id = params.fetch("creator_id")

    if @flow.valid?
      @flow.save

      redirect_to("/flows/#{@flow.id}", :notice => "Flow updated successfully.")
    else
      render("flow_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @flow = Flow.find(params.fetch("id_to_remove"))

    @flow.destroy

    redirect_to("/flows", :notice => "Flow deleted successfully.")
  end
end
