ENY['RACK_ENV'] = 'test'

require('bundler/setup')
Bundler.require(:default)


Dir[File.dirname(_FILE_) + "/../lib/*.rb"].each { |file| require file}


Rspec.configure do |config|
  config.after(:each) do
    Survey.all().each do |survey|
      survey.destroy()
    end
  end
end
