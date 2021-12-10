require 'rails_helper'

RSpec.describe Poem, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:author) }

    it { should have_many(:likes) }

    it { should have_many(:comments) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
