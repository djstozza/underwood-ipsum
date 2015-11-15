class ParagraphsController < ApplicationController
  before_action :set_paragraph, only: [:show, :edit, :update, :destroy]

  # GET /paragraphs
  # GET /paragraphs.json
  def index
    @paragraphs = Paragraph.all
    respond_to do |format|
      format.html
      format.json {render json: @paragraphs.as_json(only:[:id, :quotations, :paragraph_number], include: [:tvcharacter, {tvcharacter: {only: [:id, :name], include: [:quotes, {quotes: {only: [:id, :character_quote]}}]}}])}
    end
  end

  # GET /paragraphs/1
  # GET /paragraphs/1.json
  def show 
    respond_to do |format|
      format.html
      format.json {render json: @paragraph.as_json(only:[:id, :quotations, :paragraph_number], include: [:tvcharacter, {tvcharacter: {only: [:id, :name], include: [:quotes, {quotes: {only: [:id, :character_quote]}}]}}])}
    end
  end

  # GET /paragraphs/new
  def new
    @paragraph = Paragraph.new
    respond_to do |format|
      format.html
      format.json {render json: @paragraph.as_json(only:[:id, :quotations, :paragraph_number], include: [:tvcharacter, {tvcharacter: {only: [:id, :name], include: [:quotes, {quotes: {only: [:id, :character_quote]}}]}}])}
    end
    # gon.quotations = @paragraph.quotations
    # gon.paragraphs = @paragraph.paragraph_number
  end

  # GET /paragraphs/1/edit
  def edit
  end

  # POST /paragraphs
  # POST /paragraphs.json
  def create
    @paragraph = Paragraph.new(paragraph_params)

    respond_to do |format|
      if @paragraph.save
        format.html { redirect_to @paragraph, notice: 'Paragraph was successfully created.' }
        format.json { render :show, status: :created, location: @paragraph }
      else
        format.html { render :new }
        format.json { render json: @paragraph.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /paragraphs/1
  # PATCH/PUT /paragraphs/1.json
  def update
    respond_to do |format|
      if @paragraph.update(paragraph_params)
        format.html { redirect_to @paragraph, notice: 'Paragraph was successfully updated.' }
        format.json { render :show, status: :ok, location: @paragraph }
      else
        format.html { render :edit }
        format.json { render json: @paragraph.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /paragraphs/1
  # DELETE /paragraphs/1.json
  def destroy
    @paragraph.destroy
    respond_to do |format|
      format.html { redirect_to paragraphs_url, notice: 'Paragraph was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_paragraph
      @paragraph = Paragraph.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def paragraph_params
      params.require(:paragraph).permit(:tvcharacter_id, :quote_id, :quotations, :paragraph_number)
    end
end
