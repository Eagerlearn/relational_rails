require 'rails_helper'

RSpec.describe League do
  describe 'validations' do
    it do
      should validate_inclusion_of(:professional).
        in_array([true , false])
    end

    it { should validate_presence_of :name }
    
    it { should validate_presence_of :years_in_existence }
  end
end

