class FlowApprovalsController < ApplicationController
  def index
    @flow_approvals = FlowApproval.all

    render("flow_approval_templates/index.html.erb")
  end

  def show
    @flow_approval = FlowApproval.find(params.fetch("id_to_display"))

    render("flow_approval_templates/show.html.erb")
  end

  def new_form
    @flow_approval = FlowApproval.new

    render("flow_approval_templates/new_form.html.erb")
  end

  def create_row
    @flow_approval = FlowApproval.new

    @flow_approval.user_id = params.fetch("user_id")
    @flow_approval.flow_id = params.fetch("flow_id")

    if @flow_approval.valid?
      @flow_approval.save

      redirect_back(:fallback_location => "/flow_approvals", :notice => "Flow approval created successfully.")
    else
      render("flow_approval_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @flow_approval = FlowApproval.find(params.fetch("prefill_with_id"))

    render("flow_approval_templates/edit_form.html.erb")
  end

  def update_row
    @flow_approval = FlowApproval.find(params.fetch("id_to_modify"))

    @flow_approval.user_id = params.fetch("user_id")
    @flow_approval.flow_id = params.fetch("flow_id")

    if @flow_approval.valid?
      @flow_approval.save

      redirect_to("/flow_approvals/#{@flow_approval.id}", :notice => "Flow approval updated successfully.")
    else
      render("flow_approval_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @flow_approval = FlowApproval.find(params.fetch("id_to_remove"))

    @flow_approval.destroy

    redirect_to("/flow_approvals", :notice => "Flow approval deleted successfully.")
  end
end
