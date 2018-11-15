# frozen_string_literal: true

module Stocks
  class Destroy < ::Callable
    def initialize(stock_id:)
      @stock_id = stock_id
    end

    def call
      find_stock.destroy
    end

    private

    attr_reader :stock_id

    def find_stock
      Stock.find_by(id: stock_id)
    end
  end
end
