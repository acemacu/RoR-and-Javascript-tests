class PatientsController < ApplicationController
  
  
  # GET /patients
  # GET /patients.xml
  def index
    @patients = Patient.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @patients }
    end
  end

  # GET /patients/1
  # GET /patients/1.xml
  def show
    @patient = Patient.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @patient }
    end
  end

  # GET /patients/new
  # GET /patients/new.xml
  def new
    @patient = Patient.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @patient }
    end
  end

  # GET /patients/1/edit
  def edit
    @patient = Patient.find(params[:id])
  end

  def create
    @patient = Patient.create!(params[:patient])
    flash[:notice] = "You just added a patient!"

    respond_to do |format|
        format.html { redirect_to patients_path }
        format.js
    end
  end

  # PUT /patients/1
  # PUT /patients/1.xml
  def update
    @patient = Patient.find(params[:id])
    
    respond_to do |format|
      if @patient.update_attributes(params[:patient])
        flash[:notice] = "Patient successfully updated."
        if params[:patient][:numberOfTag]
          format.html {  render :text => params[:patient][:numberOfTag] }
          format.json  { head :ok }
        elsif params[:patient][:color]
          format.html {  render :text => params[:patient][:color] }
          format.json  { head :ok }
        elsif params[:patient][:sex]
          format.html {  render :text => params[:patient][:sex] }
          format.json  { head :ok } 
        elsif params[:patient][:age]
         format.html {  render :text => params[:patient][:age] }
          format.json  { head :ok }
        elsif params[:patient][:ageType]
          format.html {  render :text => params[:patient][:ageType] }
          format.json  { head :ok }
        else params[:patient][:complaint]
          format.html {  render :text => params[:patient][:complaint] }
          format.json  { head :ok }      
        end
      else
        format.html { render :action => "edit" }
        format.json  { render :json => @patient.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /patients/1
  # DELETE /patients/1.xml
  def destroy
    @patient = Patient.find(params[:id])
    @patient.destroy

    respond_to do |format|
      format.html { redirect_to (patients_url) }
      format.js
    end
  end
end
