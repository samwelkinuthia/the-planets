# frozen_string_literal: true

class StarsController < ApplicationController
  before_action :set_star, only: %i[show edit update destroy]

  # GET /stars
  # GET /stars.json
  def index
    @stars = Star.all
    render :index
  end

  # GET /stars/1
  # GET /stars/1.json
  def show
    @galaxy = Galaxy.find_by(id: params[:galaxy_id])
    @star = Star.find(params[:id])
    @planets = @star.planets
  end

  # GET /stars/new
  def new
    @galaxy = Galaxy.find(params[:galaxy_id])
    @star = @galaxy.stars.new
    render :new
  end

  # GET /stars/1/edit
  def edit
    @galaxy = Galaxy.find(params[:galaxy_id])
    @star = Star.find(params[:id])
    render :edit
  end

  # POST /stars
  # POST /stars.json
  def create
    @galaxy = Galaxy.find(params[:galaxy_id])
    @star = @galaxy.stars.new(star_params)

    respond_to do |format|
      if @star.save
        format.html { redirect_to galaxy_path(@star.galaxy), notice: 'Star was successfully created.' }
        format.json { render :show, status: :created, location: @star }
      else
        format.html { render :new }
        format.json { render json: @star.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stars/1
  # PATCH/PUT /stars/1.json
  def update
    respond_to do |format|
      if @star.update(star_params)
        format.html { redirect_to galaxy_star_path(@star.galaxy), notice: 'Star was successfully updated.' }
        format.json { render :show, status: :ok, location: @star }
      else
        format.html { render :edit }
        format.json { render json: @star.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stars/1
  # DELETE /stars/1.json
  def destroy
    @star = Star.find(params[:id])
    @star.destroy
    respond_to do |format|
      format.html { redirect_to galaxy_path(@star.galaxy), notice: 'Star was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_star
    @star = Star.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def star_params
    params.require(:star).permit(:name, :image, :classification, :galaxy_id)
  end
end
