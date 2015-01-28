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
