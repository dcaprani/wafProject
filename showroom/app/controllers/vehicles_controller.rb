class VehiclesController < ApplicationController
  require 'DecoratorRails'
  require 'CrashLogger'
  # GET /vehicles
  # GET /vehicles.json
  def index
    @vehicles = Vehicle.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @vehicles }
    end
  end

  # GET /vehicles/1
  # GET /vehicles/1.json
  def show
    @vehicle = Vehicle.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vehicle }
    end
  end

  # GET /vehicles/new
  # GET /vehicles/new.json
  def new
    @vehicle = Vehicle.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vehicle }
    end
  end

  # GET /vehicles/1/edit
  def edit
    @vehicle = Vehicle.find(params[:id])
  end

  # POST /vehicles
  # POST /vehicles.json
  def create
    @vehicle = Vehicle.new()

    
  # Populate the basic information from the form
  @vehicle.make = params[:vehicle][:make]
  @vehicle.model = params[:vehicle][:model]
  @vehicle.miles = params[:vehicle][:miles]
  @vehicle.colour = params[:vehicle][:colour]
  @vehicle.image = params[:vehicle][:image]
  @vehicle.owners = params[:vehicle][:owners]
  @vehicle.reg = params[:vehicle][:reg]
  @vehicle.price = params[:vehicle][:price]
  @vehicle.description = params[:vehicle][:description]
  
  myCar = BasicModelCar.new(@vehicle.make, @vehicle.model, @vehicle.miles, @vehicle.colour, @vehicle.image, @vehicle.owners, @vehicle.reg, @vehicle.price, @vehicle.description)
  crashLogger = CrashLogger.instance
    # Add some additional features to our new car
  # the statements could be written inline: params[:newcar][:fireExt].to_s.length > 0 ? myCar = FireExtinguisher.new(myCar) : null
    if params[:vehicle][:NCT].to_s.length > 0 then
      myCar = NCT.new(myCar)
    end
    if params[:vehicle][:Taxed].to_s.length > 0 then
      myCar = Taxed.new(myCar)
    end
    if params[:vehicle][:ExtendedWarranty].to_s.length > 0 then
      myCar = ExtendedWarranty.new(myCar)
    end
    if params[:vehicle][:Crashed].to_s.length > 0 then
      crashLogger.logCrash(@vehicle.reg.to_s)
    end
    
    ##Populate the cost and description information
    @vehicle.price = myCar.getPrice
    @vehicle.description = myCar.getDescription

    respond_to do |format|
      if @vehicle.save
        format.html { redirect_to @vehicle, notice: 'Vehicle was successfully created.' }
        format.json { render json: @vehicle, status: :created, location: @vehicle }
      else
        format.html { render action: "new" }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /vehicles/1
  # PUT /vehicles/1.json
  def update
    @vehicle = Vehicle.find(params[:id])

    respond_to do |format|
      if @vehicle.update_attributes(params[:vehicle])
        format.html { redirect_to @vehicle, notice: 'Vehicle was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def fueltype
    @vehicles = Vehicle.find_all_by_fueltype(params[:id])
    @fueltype = params[id]
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @vehicles}
    end
  end

  def search
    @search_term = params[:q]
    st = "%#{params[:q]}%"
    @vehicles = Vehicle.where("Make like ? or Model like ?", st, st)
    
    respond_to do |format|
      format.html #index.html.erb
      format.json {render json: @vehicles }
    end
  end


  # DELETE /vehicles/1
  # DELETE /vehicles/1.json
  def destroy
    @vehicle = Vehicle.find(params[:id])
    @vehicle.destroy

    respond_to do |format|
      format.html { redirect_to vehicles_url }
      format.json { head :no_content }
    end
  end
end
