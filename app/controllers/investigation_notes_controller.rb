class InvestigationNotesController < ApplicationController
  before_action :check_login


  def new
    @investigation_note = InvestigationNote.new
    unless params[:investigation_id].nil?
      @investigation    = Investigation.find(params[:investigation_id])
    end
  end

  def edit
    @investigation_note = InvestigationNote.find(params[:id])
    @investigation    = @investigation_note.investigation
  end


  def create
    @investigation_note = InvestigationNote.new(investigation_note_params)
    @investigation_note.date = Date.current
    if @investigation_note.save
      flash[:notice] = "Successfully created a note for #{@investigation_note.investigation.title}."
      redirect_to investigation_path(@investigation_note.investigation)
    else
      @investigation = @investigation_note.investigation
      render action: 'new'
    end      
  end

  def update
    @investigation_note = InvestigationNote.find(params[:id])
    @investigation = @investigation_note.investigation
    respond_to do |format|
      if @investigation_note.update_attributes(investigation_note_params)
        format.html { redirect_to @investigation, notice: "Updated information" }
        # format.json { respond_with_bip(@investigation) }
      else
        format.html { render :action => "edit" }
        # format.json { respond_with_bip(@investigation) }
      end
    end
  end


  def destroy
    @investigation_note = InvestigationNote.find(params[:id])
    @investigation_note.destroy
    flash[:notice] = "Successfully removed the note from GCPD."
    redirect_to investigation_path(@investigation_note.investigation)
  end


  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def investigation_note_params
    params.require(:investigation_note).permit(:officer_id, :investigation_id, :content, :date)
  end


end
