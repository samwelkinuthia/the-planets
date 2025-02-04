# frozen_string_literal: true

class PlanetsController < ApplicationController
  before_action :set_planet, only: %i[show edit update destroy]
  # GET /planets
  # GET /planets.json
  def index; end

  # GET /planets/1
  # GET /planets/1.json
  def show
  end

  # GET /planets/new
  def new
    @galaxy = Galaxy.find(params[:galaxy_id])
    @star = Star.find_by(id: params[:star_id])
    @planet = Planet.new
  end

  # GET /planets/1/edit
  def edit; end

  # POST /planets
  # POST /planets.json
  def create
    @galaxy = Galaxy.find_by(params[:galaxy_id])
    @star = Star.find_by(id: params[:star_id])
    @planet = @star.planets.new(planet_params)

    respond_to do |format|
      if @planet.save
        format.html { redirect_to galaxy_star_path(@galaxy, @star), notice: 'Planet was successfully created.' }
        format.json { render :show, status: :created, location: @planet }
      else
        format.html { render :new }
        format.json { render json: @planet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /planets/1
  # PATCH/PUT /planets/1.json
  def update
    respond_to do |format|
      if @planet.update(planet_params)
        format.html { redirect_to galaxy_star_planet_path(@planet.star.galaxy_id, @planet.star_id), notice: 'Planet was successfully updated.' }
        # format.json { render :show, status: :ok, location: @planet }
      else
        format.html { render :edit }
        format.json { render json: @planet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /planets/1
  # DELETE /planets/1.json
  def destroy
    @galaxy = Galaxy.find_by(params[:galaxy_id])
    @star = Star.find_by(id: params[:star_id])
    @planet.destroy
    respond_to do |format|
      format.html { redirect_to galaxy_star_path(@galaxy, @star), notice: 'Planet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_planet
    @planet = Planet.find_by(id: params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def planet_params
    params.require(:planet).permit(:name, :life, :moons, :image, :star_id, :galaxy_id, :description, :category)
  end
end
