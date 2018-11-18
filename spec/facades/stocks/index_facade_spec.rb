# frozen_string_literal: true

require 'rails_helper'

describe Stocks::IndexFacade do
  subject { described_class.new(user: resource, params: params) }

  let!(:resource) { create(:user) }
  let!(:stocks)    { create_list(:stock, 5, user: resource) }
  let!(:params)   { { } }

  describe '#stocks' do
    let(:subject_stocks) { subject.stocks }

    it 'returns an array of stocks' do
      expect(subject.stocks).to be_decorated_with(Draper::CollectionDecorator)
    end
  end

  describe '#first_stock' do
    let(:first_stock_name) { subject.first_stock.name }
    let(:expected_name)    { Stock.in_historic_for_user(resource).first.name }

    it 'returns the newest stock' do
      expect(first_stock_name).to be_eql(expected_name)
    end
  end

  describe '#first_stock_chart_params' do
    it 'returns hash with params' do
      expect(subject.first_stock_chart_params).to be_a(Hash)
    end
  end
end
