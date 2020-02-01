# frozen_string_literal: true

class SuperclustersController < ApplicationController
  before_action :set_supercluster, only: %i[show edit update destroy]

  def index
    @superclusters = Supercluster.all
    @supercluster = Supercluster.find_by(id: params[:id])
   end

  # GET /superclusters/1
  # GET /superclusters/1.json
  def show
    @galaxies = Galaxy.all
    @supercluster = Supercluster.find(params[:id])
  end

  # GET /superclusters/new
  def new
    @supercluster = Supercluster.new
  end

  # GET /superclusters/1/edit
  def edit; end

  # POST /superclusters
  # POST /superclusters.json
  def create
    @supercluster = Supercluster.new(supercluster_params)

    respond_to do |format|
      if @supercluster.save
        format.html { redirect_to galaxies_path, notice: 'Supercluster was successfully created.' }
        format.json { render :show, status: :created, location: @supercluster }
      else
        format.html { render :new }
        format.json { render json: @supercluster.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /superclusters/1
  # PATCH/PUT /superclusters/1.json
  def update
    respond_to do |format|
      if @supercluster.update(supercluster_params)
        format.html { redirect_to @supercluster, notice: 'Supercluster was successfully updated.' }
        format.json { render :show, status: :ok, location: @supercluster }
      else
        format.html { render :edit }
        format.json { render json: @supercluster.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /superclusters/1
  # DELETE /superclusters/1.json
  def destroy
    @supercluster.destroy
    respond_to do |format|
      format.html { redirect_to superclusters_url, notice: 'Supercluster was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_supercluster
    @supercluster = Supercluster.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def supercluster_params
    params.require(:supercluster).permit(:name)
  end
end
