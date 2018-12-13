class FlowCommentsController < ApplicationController
  def index
    @flow_comments = FlowComment.all

    render("flow_comment_templates/index.html.erb")
  end

  def show
    @flow_comment = FlowComment.find(params.fetch("id_to_display"))

    render("flow_comment_templates/show.html.erb")
  end

  def new_form
    @flow_comment = FlowComment.new

    render("flow_comment_templates/new_form.html.erb")
  end

  def create_row
    @flow_comment = FlowComment.new

    @flow_comment.flow_id = params.fetch("flow_id")
    @flow_comment.body = params.fetch("body")
    @flow_comment.user_id = params.fetch("user_id")

    if @flow_comment.valid?
      @flow_comment.save

      redirect_back(:fallback_location => "/flow_comments", :notice => "Flow comment created successfully.")
    else
      render("flow_comment_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @flow_comment = FlowComment.find(params.fetch("prefill_with_id"))

    render("flow_comment_templates/edit_form.html.erb")
  end

  def update_row
    @flow_comment = FlowComment.find(params.fetch("id_to_modify"))

    @flow_comment.flow_id = params.fetch("flow_id")
    @flow_comment.body = params.fetch("body")
    @flow_comment.user_id = params.fetch("user_id")

    if @flow_comment.valid?
      @flow_comment.save

      redirect_to("/flow_comments/#{@flow_comment.id}", :notice => "Flow comment updated successfully.")
    else
      render("flow_comment_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @flow_comment = FlowComment.find(params.fetch("id_to_remove"))

    @flow_comment.destroy

    redirect_to("/flow_comments", :notice => "Flow comment deleted successfully.")
  end
end
