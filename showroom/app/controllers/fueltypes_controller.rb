class FueltypesController < ApplicationController
  # GET /fueltypes
  # GET /fueltypes.json
  def index
    @fueltypes = Fueltype.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @fueltypes }
    end
  end

  # GET /fueltypes/1
  # GET /fueltypes/1.json
  def show
    @fueltype = Fueltype.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @fueltype }
    end
  end

  # GET /fueltypes/new
  # GET /fueltypes/new.json
  def new
    @fueltype = Fueltype.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @fueltype }
    end
  end

  # GET /fueltypes/1/edit
  def edit
    @fueltype = Fueltype.find(params[:id])
  end

  # POST /fueltypes
  # POST /fueltypes.json
  def create
    @fueltype = Fueltype.new(params[:fueltype])

    respond_to do |format|
      if @fueltype.save
        format.html { redirect_to @fueltype, notice: 'Fueltype was successfully created.' }
        format.json { render json: @fueltype, status: :created, location: @fueltype }
      else
        format.html { render action: "new" }
        format.json { render json: @fueltype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /fueltypes/1
  # PUT /fueltypes/1.json
  def update
    @fueltype = Fueltype.find(params[:id])

    respond_to do |format|
      if @fueltype.update_attributes(params[:fueltype])
        format.html { redirect_to @fueltype, notice: 'Fueltype was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @fueltype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fueltypes/1
  # DELETE /fueltypes/1.json
  def destroy
    @fueltype = Fueltype.find(params[:id])
    @fueltype.destroy

    respond_to do |format|
      format.html { redirect_to fueltypes_url }
      format.json { head :no_content }
    end
  end
end
