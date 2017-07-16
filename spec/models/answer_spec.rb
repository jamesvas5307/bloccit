require 'rails_helper'

RSpec.describe Answer, type: :model do
  let(:question) {Question.create!(title:"Question Title", body:"Question Body", resolved:false )}
  let(:answer) {Answer.create!(body:"Answer Body", question: question)}

  describe "check answer attributes" do
    it "checks for answer attributes" do
      expect(answer).to have_attributes(body:"Answer Body")
    end
  end
end
