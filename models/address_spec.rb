require 'rails_helper'

RSpec.describe Address, type: :model do
  describe "associations" do
    it { should belong_to(:addressable).class_name('Address') }
    it { should have_many(:orders) }
  end
  
end
