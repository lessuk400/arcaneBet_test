# frozen_string_literal: true

class Callable < SmartInit::Base
  include MandatoryMethods

  is_callable
end
