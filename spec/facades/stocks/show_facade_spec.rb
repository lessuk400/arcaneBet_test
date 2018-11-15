# frozen_string_literal: true

require 'rails_helper'

describe Stocks::ShowFacade do
  subject { described_class.new(stock_id: resource) }

  let(:user)      { create(:user) }
  let(:resource) { create(:stock, user: user).id }

  describe '#chart_params' do
    it 'returns hash with params' do
      expect(subject.chart_params).to be_a(Hash)
    end
  end
end
