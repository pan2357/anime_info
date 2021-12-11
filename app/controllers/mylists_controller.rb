class MylistsController < ApplicationController
  before_action :set_mylist, only: %i[ show edit update destroy ]

  # GET /mylists or /mylists.json
  def index
    @mylists = Mylist.all
  end

  # GET /mylists/1 or /mylists/1.json
  def show
  end

  # GET /mylists/new
  def new
    @mylist = Mylist.new
  end

  # GET /mylists/1/edit
  def edit
  end

  # POST /mylists or /mylists.json
  def create
    @mylist = Mylist.new(mylist_params)

    respond_to do |format|
      if @mylist.save
        format.html { redirect_to @mylist, notice: "Mylist was successfully created." }
        format.json { render :show, status: :created, location: @mylist }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mylist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mylists/1 or /mylists/1.json
  def update
    respond_to do |format|
      if @mylist.update(mylist_params)
        format.html { redirect_to @mylist, notice: "Mylist was successfully updated." }
        format.json { render :show, status: :ok, location: @mylist }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mylist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mylists/1 or /mylists/1.json
  def destroy
    @mylist.destroy
    respond_to do |format|
      format.html { redirect_to mylists_url, notice: "Mylist was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mylist
      @mylist = Mylist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mylist_params
      params.require(:mylist).permit(:user_id, :anime_id)
    end
end
