require('spec_helper')

describe(Survey) do
  describe("#upcase_title") do
    it("will upcase the first letter in all words of name before being saved") do
      test_survey= Survey.create({:name => "epicodus weekly"})
      test_survey.upcase_title()
      expect(test_survey.name()).to(eq("Epicodus Weekly"))
    end
  end
end
