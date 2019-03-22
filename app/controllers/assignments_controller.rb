class AssignmentsController < ApplicationController
  before_action :check_login


  def new
    @assignment = Assignment.new
    unless params[:officer_id].nil?
      @officer    = Officer.find(params[:officer_id])
      @officer_investigations = @officer.assignments.current.map{|a| a.investigation }
    else
      @investigation    = Investigation.find(params[:investigation_id])
      @investigation_officers = @investigation.assignments.current.map{|a| a.officer }
    end

  end
  
  def create
    @assignment = Assignment.new(assignment_params)
    @assignment.start_date = Date.current

    if @assignment.save
      flash[:notice] = "Successfully added assignment."
      if @assignment.from == 'officer'
        redirect_to officer_path(@assignment.officer)
      else
        redirect_to investigation_path(@assignment.investigation)
      end
    else
      @officer     = Officer.find(params[:assignment][:officer_id])
      render action: 'new', locals: { officer: @officer }
    end
  end

  def terminate
    @assignment = Assignment.find(params[:id])
    @assignment.end_date = Date.current
    @assignment.save
    unless params[:officer_id].nil?
      redirect_to officer_path(@assignment.officer)
    else
      redirect_to investigation_path(@assignment.investigation)
    end
  end

  private
  def assignment_params
    params.require(:assignment).permit(:investigation_id, :officer_id, :start_date, :end_date, :from)
  end
end
