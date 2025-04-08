require 'rails_helper'

RSpec.describe Task, type: :model do
  describe "validations" do
    it "is valid with valid attributes" do
      task = build(:task)
      expect(task).to be_valid
    end

    it "is invalid without a title" do
      task = build(:task, title: nil)
      task.validate
      expect(task.errors[:title]).to include("can't be blank")
    end

    it "is invalid with a duplicate title" do
      create(:task, title: "UniqueTitle")
      task = build(:task, title: "UniqueTitle")
      task.validate
      expect(task.errors[:title]).to include("has already been taken")
    end

    it "is invalid without a due_date" do
      task = build(:task, due_date: nil)
      task.validate
      expect(task.errors[:due_date]).to include("can't be blank")
    end

    it "is invalid with a past due_date" do
      task = build(:task, due_date: Date.yesterday)
      task.validate
      expect(task.errors[:due_date]).to include("can't be in the past")
    end
  end

  describe "#image_url" do
    it "returns nil if no image is attached" do
      task = build(:task)
      expect(task.image_url).to be_nil
    end

    it "returns the image URL if image is attached" do
      task = create(:task)
      file = fixture_file_upload(Rails.root.join("spec/fixtures/files/sample.jpg"), "image/jpeg")
      task.image.attach(file)

      expect(task.image_url).to be_present
      expect(task.image_url).to include("/rails/active_storage")
    end
  end
end
