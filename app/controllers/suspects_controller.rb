class SuspectsController < ApplicationController
  before_action :check_login


  def new
    @suspect = Suspect.new
    unless params[:investigation_id].nil?
      @investigation    = Investigation.find(params[:investigation_id])
      @investigation_criminals = @investigation.suspects.map{|s| s.criminal}
    end
  end



  def create
    @suspect = Suspect.new(suspect_params)
    @suspect.added_on = Date.current
    if @suspect.save
      flash[:notice] = "Successfully created #{@suspect.criminal.proper_name}."
      redirect_to investigation_path(@suspect.investigation) 
    else
      render action: 'new'
    end      
  end


  def remove
     @suspect = Suspect.find(params[:id])
    @suspect.dropped_on = Date.current
    @suspect.save
    redirect_to investigation_path(@suspect.investigation)
  end





  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def suspect_params
    params.require(:suspect).permit(:criminal_id, :investigation_id, :added_on, :dropped_on)
  end


end
