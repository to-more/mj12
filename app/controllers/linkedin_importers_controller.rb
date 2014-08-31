class LinkedinImportersController < ApplicationController
  before_action :set_linkedin_importer, only: [:show, :edit, :update, :destroy]
  include LinkedinImportersHelper
  # GET /linkedin_importers
  # GET /linkedin_importers.json
  def index
    @linkedin_importers = LinkedinImporter.all
  end

  # GET /linkedin_importers/1
  # GET /linkedin_importers/1.json
  def show
  end

  # GET /linkedin_importers/new
  def new
    @linkedin_importer = LinkedinImporter.new
  end

  # GET /linkedin_importers/1/edit
  def edit
  end

  def import_from_linkedin
    @linkedin_importer = LinkedinImporter.new(linkedin_importer_params)

    profile = Linkedin::Profile.get_profile(@linkedin_importer.url)

    entity = prepare_to_import profile

    add_meta_to_entity entity, profile

    begin
      profile.recommended_visitors.each do | recomended |

        recomended_profile = Linkedin::Profile.get_profile(recomended[:link])

        recomended_entity = prepare_to_import recomended_profile

        add_meta_to_entity recomended_entity, recomended_profile

        add_links_to_entity entity, recomended_entity
      end
    rescue Exception => e
      puts e.message
    end    

    redirect_to root_path
  end

  # POST /linkedin_importers
  # POST /linkedin_importers.json
  def create
    @linkedin_importer = LinkedinImporter.new(linkedin_importer_params)

    respond_to do |format|
      if @linkedin_importer.save
        format.html { redirect_to @linkedin_importer, notice: 'Linkedin importer was successfully created.' }
        format.json { render action: 'show', status: :created, location: @linkedin_importer }
      else
        format.html { render action: 'new' }
        format.json { render json: @linkedin_importer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /linkedin_importers/1
  # PATCH/PUT /linkedin_importers/1.json
  def update
    respond_to do |format|
      if @linkedin_importer.update(linkedin_importer_params)
        format.html { redirect_to @linkedin_importer, notice: 'Linkedin importer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @linkedin_importer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /linkedin_importers/1
  # DELETE /linkedin_importers/1.json
  def destroy
    @linkedin_importer.destroy
    respond_to do |format|
      format.html { redirect_to linkedin_importers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_linkedin_importer
      @linkedin_importer = LinkedinImporter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def linkedin_importer_params
      params.require(:linkedin_importer).permit( :profile, :url, :idProfile)
    end
end
