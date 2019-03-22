class CriminalsController < ApplicationController
  before_action :set_criminal, only: [:show, :edit, :update, :destroy]
  before_action :check_login


  def index
    @criminals = Criminal.alphabetical.paginate(page: params[:page]).per_page(10)
    @enhanced_powers = Criminal.enhanced.alphabetical.paginate(page: params[:page]).per_page(10)
  end

  def show

  end

  def new
    @criminal = Criminal.new
  end

  def edit
  end

  def create
    @criminal = Criminal.new(criminal_params)
    if @criminal.save
      flash[:notice] = "Successfully created #{@criminal.proper_name}."
      redirect_to criminal_path(@criminal) 
    else
      render action: 'new'
    end      
  end

  def update
    respond_to do |format|
      if @criminal.update_attributes(criminal_params)
        format.html { redirect_to @criminal, notice: "Updated all information" }
        format.json { respond_with_bip(@criminal) }
      else
        format.html { render :action => "edit" }
        format.json { respond_with_bip(@criminal) }
        
      end
    end
  end

  def search
    redirect_back(fallback_location: criminals_path) if params[:query].blank?
    @query = params[:query]
    @criminals = Criminal.search(@query)
    @total_hits = @criminals.size
  end


  def destroy
    if @criminal.destroy
      flash[:notice] = "Successfully removed #{@criminal.proper_name} from GCPD."
      redirect_to criminals_url
    else
      render action: 'show'
    end
  end





  private
  # Use callbacks to share common setup or constraints between actions.
  def set_criminal
    @criminal = Criminal.find(params[:id])
  end
  # Never trust parameters from the scary internet, only allow the white list through.
  def criminal_params
    params.require(:criminal).permit(:first_name, :last_name, :aka, :convicted_felon, :enhanced_powers, :notes)
  end


end
