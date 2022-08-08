require 'rails_helper'

RSpec.describe Plant, type: :model do
  describe 'relationships' do
    # it { should belong_to(:garden) }
  end

  describe 'validations' do
    it { should validate_presence_of :name}
    it { should validate_presence_of :description}
    it { should validate_presence_of :days_to_harvest}
  end
end