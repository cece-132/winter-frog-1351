require 'rails_helper'

RSpec.describe Plot, type: :model do
  describe 'relationships' do
    it { should belong_to(:garden) }
  end

  describe 'validations' do
    it { should validate_presence_of :number}
    it { should validate_presence_of :size}
    it { should validate_presence_of :direction}
  end
end
