class TvcharactersController < ApplicationController
  before_action :set_tvcharacter, only: [:show, :edit, :update, :destroy]

  # GET /tvcharacters
  # GET /tvcharacters.json
  def index
    @tvcharacters = Tvcharacter.all
  end

  # GET /tvcharacters/1
  # GET /tvcharacters/1.json
  def show
  end

  # GET /tvcharacters/new
  def new
    @tvcharacter = Tvcharacter.new
  end

  # GET /tvcharacters/1/edit
  def edit
  end

  # POST /tvcharacters
  # POST /tvcharacters.json
  def create
    @tvcharacter = Tvcharacter.new(tvcharacter_params)

    respond_to do |format|
      if @tvcharacter.save
        format.html { redirect_to @tvcharacter, notice: 'Tvcharacter was successfully created.' }
        format.json { render :show, status: :created, location: @tvcharacter }
      else
        format.html { render :new }
        format.json { render json: @tvcharacter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tvcharacters/1
  # PATCH/PUT /tvcharacters/1.json
  def update
    respond_to do |format|
      if @tvcharacter.update(tvcharacter_params)
        format.html { redirect_to @tvcharacter, notice: 'Tvcharacter was successfully updated.' }
        format.json { render :show, status: :ok, location: @tvcharacter }
      else
        format.html { render :edit }
        format.json { render json: @tvcharacter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tvcharacters/1
  # DELETE /tvcharacters/1.json
  def destroy
    @tvcharacter.destroy
    respond_to do |format|
      format.html { redirect_to tvcharacters_url, notice: 'Tvcharacter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tvcharacter
      @tvcharacter = Tvcharacter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tvcharacter_params
      params.require(:tvcharacter).permit(:name)
    end
end
