class Question < ActiveRecord::Base
  belongs_to(:survey)
  has_many(:responses)

  define_method(:add_responses) do |responses|
    responses = responses.split(",")
    responses.each() do |response|
      Response.create({:description => response, :question_id => self.id})
    end
  end


end
