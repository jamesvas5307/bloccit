require 'rails_helper'

RSpec.describe Comment, type: :model do
    let(:topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
    let(:post) { topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph) }

  describe "attributes" do
    it "has a body attribute" do
      expect(comment).to have_attributes(body: body)
    end
  end
end
