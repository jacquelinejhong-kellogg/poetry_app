require 'rails_helper'

RSpec.describe Poet, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:poems) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
