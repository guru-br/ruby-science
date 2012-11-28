class CompletionsController < ApplicationController
  def create
    @survey = Survey.find(params[:survey_id])
    completion_params = params.require(:completion).permit(:answers_attributes)
    completion = @survey.completions.new(completion_params)
    completion.user = current_user
    completion.save!
    redirect_to [@survey, :completions]
  end

  def index
    @survey = Survey.find(params[:survey_id])
    @completions = @survey.completions
  end
end