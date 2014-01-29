class FormParqsController < ApplicationController
  before_action :set_form_parq, only: [:show, :edit, :update, :destroy]
  skip_before_filter :require_login

  # def index
  #   @form_parqs = FormParq.all
  # end

  # GET /form_parqs/1
  # GET /form_parqs/1.json
  def show
  end

  # GET /form_parqs/new
  def new
    if current_user.form_parq.nil?
      @form_parq = current_user.build_form_parq
    else
      redirect_to current_user.form_parq
    end
  end

  # GET /form_parqs/1/edit
  def edit
    @form_parq = current_user.form_parq.nil? ? current_user.build_form_parq : current_user.form_parq
  end

  # POST /form_parqs
  # POST /form_parqs.json
  def create
    @form_parq = current_user.build_form_parq(form_parq_params)

    respond_to do |format|
      if @form_parq.save
        format.html { redirect_to @form_parq, notice: 'Formulário de PAR-Q preenchido com sucesso.' }
        format.json { render action: 'show', status: :created, location: @form_parq }
      else
        format.html { render action: 'new' }
        format.json { render json: @form_parq.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /form_parqs/1
  # PATCH/PUT /form_parqs/1.json
  def update
    respond_to do |format|
      if @form_parq.update(form_parq_params)
        format.html { redirect_to @form_parq, notice: 'Form parq was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @form_parq.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /form_parqs/1
  # DELETE /form_parqs/1.json
  def destroy
    @form_parq.destroy
    respond_to do |format|
      format.html { redirect_to form_parqs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_form_parq
      @form_parq = FormParq.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def form_parq_params
      params.require(:form_parq).permit(:answer1, :answer2, :answer3, :answer4, :answer5, :answer6, :answer7, :user_id)
    end
end
