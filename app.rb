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
  @questions = Question.all()
  erb(:survey)
end

post('/questions') do
  survey_id= params.fetch('survey_id').to_i()
  description= params.fetch('description')
  @survey = Survey.find(survey_id)
  Question.create({:description => description, :survey_id => survey_id})
  @questions= Question.all()
erb(:survey)
end
