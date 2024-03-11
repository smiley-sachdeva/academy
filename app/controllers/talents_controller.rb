class TalentsController < ApplicationController
  before_action :set_talent, only: %i[ show update destroy ]

  # GET /talents or /talents.json
  def index
    @talents = Talent.all
  end

  # GET /talents/1 or /talents/1.json
  def show
  end

  # POST /talents or /talents.json
  def create
    @talent = Talent.new(talent_params)

    respond_to do |format|
      if @talent.save
        format.json { render :show, status: :created, location: @talent }
      else
        format.json { render json: @talent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /talents/1 or /talents/1.json
  def update
    respond_to do |format|
      if @talent.update(talent_params)
        format.json { render :show, status: :ok, location: @talent }
      else
        format.json { render json: @talent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /talents/1 or /talents/1.json
  def destroy
    @talent.destroy

    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_talent
      @talent = Talent.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def talent_params
      params.require(:talent).permit(:name, :email)
    end
end
