require 'rails_helper'

RSpec.describe Garden, type: :model do
  describe 'relationships' do
    it { should have_many(:plots) }
  end

  describe 'validations' do
    it { should validate_presence_of :name}
    it { should validate_presence_of :organic}
  end
end
