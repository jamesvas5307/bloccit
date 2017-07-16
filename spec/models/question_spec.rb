require 'rails_helper'

RSpec.describe Question, type: :model do
  let(:question) {Question.create!(title:"Question Title", body:"Question Body", resolved:false )}
  describe "question has it's attributes" do
    it "has body, title, and resolved attributes" do
      expect(question).to have_attributes(title:"Question Title", body:"Question Body", resolved:false)
    end
  end
end
