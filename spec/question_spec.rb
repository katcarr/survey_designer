require("spec_helper")

describe(Question) do
  it { should belong_to(:survey) }
  it { should have_many(:responses)}

  describe("add_responses") do
    it("take in a comma seperated string and create repsonses related to itslef") do
      test_question = Question.create({:description => "Will the Seahawks win?"})
      test_responses = "yes,no,maybe"
      test_question.add_responses(test_responses)
      expect(test_question.responses().first().description()).to(eq("yes"))
    end
  end
end
