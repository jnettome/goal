class TrainingsController < ApplicationController
  skip_before_filter :require_login
  before_action :set_training, only: [:show, :edit, :update, :destroy]

  # GET /trainings
  # GET /trainings.json
  def index
    @trainings = current_user.trainings.all
  end

  # GET /trainings/1
  # GET /trainings/1.json
  def show
  end

  # GET /trainings/new
  def new
    @training = current_user.trainings.new
  end

  # GET /trainings/1/edit
  def edit
  end

  # POST /trainings
  # POST /trainings.json
  def create
    @training = current_user.trainings.new(training_params)

    respond_to do |format|
      if @training.save
        format.html { redirect_to @training, notice: 'Treino criado com sucesso' }
        format.json { render action: 'show', status: :created, location: @training }
      else
        format.html { render action: 'new' }
        format.json { render json: @training.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trainings/1
  # PATCH/PUT /trainings/1.json
  def update
    respond_to do |format|
      if @training.update(training_params)
        format.html { redirect_to @training, notice: 'Alterações salvas com sucesso' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @training.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trainings/1
  # DELETE /trainings/1.json
  def destroy
    @training.destroy
    respond_to do |format|
      format.html { redirect_to trainings_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_training
      @training = current_user.trainings.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def training_params
      params.require(:training).permit(:name, :objective, :duration, :schedule, :body_group,
        exercises_attributes: [
          :id, :name, :repetitions, :series, :interval, :weight, :training_id, :_destroy
        ])
    end
end
