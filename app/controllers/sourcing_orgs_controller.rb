class SourcingOrgsController < ApplicationController
  before_action :set_sourcing_org, only: [:show, :edit, :update, :destroy]

  # GET /sourcing_orgs
  # GET /sourcing_orgs.json
  def index
    @sourcing_orgs = SourcingOrg.all
  end

  # GET /sourcing_orgs/1
  # GET /sourcing_orgs/1.json
  def show
  end

  # GET /sourcing_orgs/new
  def new
    @sourcing_org = SourcingOrg.new
  end

  # GET /sourcing_orgs/1/edit
  def edit
  end

  # POST /sourcing_orgs
  # POST /sourcing_orgs.json
  def create
    @sourcing_org = SourcingOrg.new(sourcing_org_params)

    respond_to do |format|
      if @sourcing_org.save
        format.html { redirect_to @sourcing_org, notice: 'Sourcing org was successfully created.' }
        format.json { render :show, status: :created, location: @sourcing_org }
      else
        format.html { render :new }
        format.json { render json: @sourcing_org.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sourcing_orgs/1
  # PATCH/PUT /sourcing_orgs/1.json
  def update
    respond_to do |format|
      if @sourcing_org.update(sourcing_org_params)
        format.html { redirect_to @sourcing_org, notice: 'Sourcing org was successfully updated.' }
        format.json { render :show, status: :ok, location: @sourcing_org }
      else
        format.html { render :edit }
        format.json { render json: @sourcing_org.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sourcing_orgs/1
  # DELETE /sourcing_orgs/1.json
  def destroy
    @sourcing_org.destroy
    respond_to do |format|
      format.html { redirect_to sourcing_orgs_url, notice: 'Sourcing org was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sourcing_org
      @sourcing_org = SourcingOrg.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sourcing_org_params
      params.require(:sourcing_org).permit(:code, :desc)
    end
end
