class StudentResultsController < ApplicationController
  before_action :set_student_result, only: %i[ show edit update destroy ]

  def index
    @q = StudentResult.all.ransack(params[:q])
    @pagy, @student_results = pagy(@q.result)
  end

  def show
  end

  def new
    @student_result = StudentResult.new
  end

  def edit; end

  def create
    @student_result = StudentResult.new(student_result_params)
    if @student_result.save
      redirect_to @student_result, notice: "StudentResult was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @student_result.update(student_result_params)
      redirect_to @student_result, notice: "StudentResult was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @student_result.destroy
    redirect_to properties_url, notice: "StudentResult was successfully destroyed."
  end

  def import_file
    StudentResult.import(params[:file])
    redirect_to student_results_path, notice: "StudentResults imported successfully from file."
  end

  private

  def set_student_result
    @student_result = StudentResult.find(params[:id])
  end

  def student_result_params
    params.require(:student_result).permit(:student_id, :conversion_type, :input_value, :student_response, :input_measure_unit, :target_measure_unit)
  end
end
