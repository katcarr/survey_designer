require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file}

get("/") do
  @surveys = Survey.all()
  erb(:index)
end

post('/surveys') do
  name = params.fetch('name')
  Survey.create({:name => name})
  @surveys = Survey.all()
  erb(:index)
end

get('/survey/:id') do
  survey_id = params.fetch("id").to_i()
  @survey = Survey.find(survey_id)
  @questions = @survey.questions()
  erb(:survey)
end

post('/questions') do
  survey_id= params.fetch('survey_id').to_i()
  description= params.fetch('description')
  @survey = Survey.find(survey_id)
  Question.create({:description => description, :survey_id => survey_id})
  @questions= @survey.questions()
  erb(:survey)
end

get('/edit_question/:id') do
  @question = Question.find(params.fetch("id").to_i())
  erb(:edit_question)
end

patch('/edit_question') do
  new_description = params.fetch("new_description")
  question_id = params.fetch("question_id").to_i()
  @question = Question.find(question_id)
  @question.update({:description => new_description})
  erb(:edit_question)
end

delete('/delete_question') do
  question_id= params.fetch("question_id").to_i()
  @question= Question.find(question_id)
  @survey= Survey.find(@question.survey_id())
  @question.destroy()
  @questions= @survey.questions()
  erb(:survey)
end

get('/edit_survey/:id') do
  @survey= Survey.find(params.fetch("id").to_i())
  erb(:edit_survey)
end

patch('/edit_survey') do
  new_name= params.fetch("new_name")
  survey_id= params.fetch("survey_id").to_i()
  @survey= Survey.find(survey_id)
  @survey.update({:name => new_name})
  erb(:edit_survey)
end

delete('/delete_survey') do
  survey_id= params.fetch("survey_id").to_i()
  @survey= Survey.find(survey_id)
  @survey.questions().each() do |question|
    question.destroy()
  end
  @survey.destroy()
  @surveys= Survey.all()
  erb(:index)
end
