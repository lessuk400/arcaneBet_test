# frozen_string_literal: true

module Stocks
  class IndexFacade
    include Pagy::Backend

    PER_PAGE     = 10
    DEFAULT_PAGE = 1
    OFFSET       = 1

    def initialize(params:, user:)
      @params = params
      @user   = user
    end

    def stocks
      @stocks ||= StockDecorator.decorate_collection(paginated_stocks.second)
    end

    def pagination
      @pagination ||= paginated_stocks.first
    end

    def page_counter
      PER_PAGE * (page.to_i - 1) + OFFSET
    end

    def account_info
      user.decorate.short_info
    end

    private

    attr_reader :user, :params

    def paginated_stocks
      @paginated_stocks ||= pagy(user_stocks, page: page, items: PER_PAGE)
    end

    def page
      params.fetch(:page, DEFAULT_PAGE)
    end

    def user_stocks
      Stock.where(user: user)
    end
  end
end
