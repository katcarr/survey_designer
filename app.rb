require("bundle/setup")
Bundler.require(:default)

DIR[File.dirname(_FILE_) + '/lib/*.rb'].each { |file| require file}
