class CrimeInvestigationsController < ApplicationController
  before_action :check_login


  def new
    @crime_investigation = CrimeInvestigation.new
    unless params[:investigation_id].nil?
      @investigation    = Investigation.find(params[:investigation_id])
      @investigation_crimes = @investigation.crimes.active.to_a
    end 
  end
  
  def create
    @crime_investigation = CrimeInvestigation.new(crime_investigation_params)
    if @crime_investigation.save
      flash[:notice] = "Successfully added #{@crime_investigation.crime.name} to the investigation."
      redirect_to investigation_path(@crime_investigation.investigation)
    else
      render action: 'new'
    end
  end

  def destroy
    @crime_investigation = CrimeInvestigation.find(params[:id])
    @crime_investigation.destroy
    flash[:notice] = "Successfully removed #{@crime_investigation.crime.name} from the investigation."
    redirect_to investigation_path(@crime_investigation.investigation)
  end

  private
  def crime_investigation_params
    params.require(:crime_investigation).permit(:investigation_id, :crime_id)
  end
end
