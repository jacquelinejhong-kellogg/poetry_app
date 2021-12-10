require "rails_helper"

RSpec.describe Like, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:poet) }

    it { should belong_to(:poem) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
