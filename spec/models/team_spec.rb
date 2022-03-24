require 'rails_helper'

RSpec.describe Team do
  describe 'validations' do
    it do
      should validate_inclusion_of(:expansion_team).
        in_array([true , false])
    end

    it { should validate_presence_of :name }
    
    it { should validate_presence_of :number_of_players }
  end
end