require('spec_helper')

describe(Survey) do

  it {should have_many(:questions)}


  describe("#upcase_title") do
    it("will upcase the first letter in all words of name before being saved") do
      test_survey= Survey.create({:name => "epicodus weekly"})
      expect(test_survey.name()).to(eq("Epicodus Weekly"))
    end
  end

  it("should have qestions") do
    test_survey = Survey.create({:name => "epicodus weekly"})
    test_question = Question.create({:description => "how do you like it?", :survey_id => test_survey.id()})
    expect(test_survey.questions()).to(eq([test_question]))
  end



end
