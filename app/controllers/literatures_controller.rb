class LiteraturesController < ApplicationController
  before_action :set_literature, only: %i[ show edit update destroy ]

  # GET /literatures or /literatures.json
  def index
    @literatures = Literature.all
  end

  # GET /literatures/1 or /literatures/1.json
  def show
  end

  # GET /literatures/new
  def new
    @literature = Literature.new
  end

  # GET /literatures/1/edit
  def edit
  end

  # POST /literatures or /literatures.json
  def create
    @literature = Literature.new(literature_params)

    respond_to do |format|
      if @literature.save
        format.html { redirect_to literature_url(@literature), notice: "Literature was successfully created." }
        format.json { render :show, status: :created, location: @literature }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @literature.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /literatures/1 or /literatures/1.json
  def update
    respond_to do |format|
      if @literature.update(literature_params)
        format.html { redirect_to literature_url(@literature), notice: "Literature was successfully updated." }
        format.json { render :show, status: :ok, location: @literature }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @literature.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /literatures/1 or /literatures/1.json
  def destroy
    @literature.destroy

    respond_to do |format|
      format.html { redirect_to literatures_url, notice: "Literature was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_literature
      @literature = Literature.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def literature_params
      params.require(:literature).permit(:title, :literature)
    end
end
