class SiteSectionsController < ApplicationController
  before_action :set_site_section, only: [:show, :edit, :update, :destroy]
  layout 'admin'

  # GET /site_sections
  # GET /site_sections.json
  def index
    @site_sections = SiteSection.all
  end

  # GET /site_sections/1
  # GET /site_sections/1.json
  def show
  end

  # GET /site_sections/new
  def new
    @site_section = SiteSection.new
  end

  # GET /site_sections/1/edit
  def edit
  end

  # POST /site_sections
  # POST /site_sections.json
  def create
    @site_section = SiteSection.new(site_section_params)

    respond_to do |format|
      if @site_section.save
        format.html { redirect_to @site_section, notice: 'Site section was successfully created.' }
        format.json { render action: 'show', status: :created, location: @site_section }
      else
        format.html { render action: 'new' }
        format.json { render json: @site_section.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /site_sections/1
  # PATCH/PUT /site_sections/1.json
  def update
    respond_to do |format|
      if @site_section.update(site_section_params)
        format.html { redirect_to @site_section, notice: 'Site section was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @site_section.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /site_sections/1
  # DELETE /site_sections/1.json
  def destroy
    @site_section.destroy
    respond_to do |format|
      format.html { redirect_to site_sections_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_site_section
      @site_section = SiteSection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def site_section_params
      params.require(:site_section).permit(:tag, :data_type, :value)
    end
end
