# frozen_string_literal: true

require 'rails_helper'

describe Stocks::IndexFacade do
  subject { described_class.new(user: resource, params: params) }

  let!(:resource) { create(:user) }
  let!(:stocks)   { create_list(:stock, 20, user: resource) }
  let!(:params)   { { } }

  describe '#stocks' do
    let(:subject_stocks) { subject.stocks }

    it 'return an array of stocks' do
      expect(subject.stocks).to be_decorated_with(Draper::CollectionDecorator)
    end
  end
end
