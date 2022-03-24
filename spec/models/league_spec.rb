require 'rails_helper'

RSpec.describe League do
  it do
    should validate_inclusion_of(:professional).
      in_array([true , false])
  end
end