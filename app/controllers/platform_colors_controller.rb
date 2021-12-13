class PlatformColorsController < ApplicationController
  before_action :set_platform_color, only: %i[ show edit update destroy ]

  # GET /platform_colors or /platform_colors.json
  def index
    @platform_colors = PlatformColor.all
  end

  # GET /platform_colors/1 or /platform_colors/1.json
  def show
  end

  # GET /platform_colors/new
  def new
    @platform_color = PlatformColor.new
  end

  # GET /platform_colors/1/edit
  def edit
  end

  # POST /platform_colors or /platform_colors.json
  def create
    @platform_color = PlatformColor.new(platform_color_params)

    respond_to do |format|
      if @platform_color.save
        format.html { redirect_to @platform_color, notice: "Platform color was successfully created." }
        format.json { render :show, status: :created, location: @platform_color }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @platform_color.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /platform_colors/1 or /platform_colors/1.json
  def update
    respond_to do |format|
      if @platform_color.update(platform_color_params)
        format.html { redirect_to @platform_color, notice: "Platform color was successfully updated." }
        format.json { render :show, status: :ok, location: @platform_color }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @platform_color.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /platform_colors/1 or /platform_colors/1.json
  def destroy
    @platform_color.destroy
    respond_to do |format|
      format.html { redirect_to platform_colors_url, notice: "Platform color was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_platform_color
      @platform_color = PlatformColor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def platform_color_params
      params.require(:platform_color).permit(:platform, :color)
    end
end
