# frozen_string_literal: true

module Stocks
  class IndexFacade
    include Pagy::Backend

    PER_PAGE     = 10
    DEFAULT_PAGE = 1
    OFFSET       = 1

    delegate :email,      to: :user,       prefix: true, allow_nil: true
    delegate :created_at, to: :last_stock, prefix: true, allow_nil: true

    def initialize(params:, user:)
      @params = params
      @user   = user
    end

    def stocks
      @stocks ||= StockDecorator.decorate_collection(paginated_stocks.second)
    end

    def first_stock_chart_params
      ::Stocks::CompoundInterest.call(stock_id: user_stocks.first)
    end

    def last_update
      @last_update ||= first_stock.created_at.strftime(I18n.t('time.formats.date'))
    end

    def pagination
      @pagination ||= paginated_stocks.first
    end

    def page_counter
      PER_PAGE * (page.to_i - 1) + OFFSET
    end

    def first_stock
      @first_stock ||= user_stocks.first
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
      @user_stocks ||= Stock.in_historic_for_user(user)
    end
  end
end
