require 'rails_helper'

RSpec.describe Poet, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:sent_friend_requests) }

    it { should have_many(:likes) }

    it { should have_many(:comments) }

    it { should have_many(:poems) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
