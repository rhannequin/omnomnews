# frozen_string_literal: true

module Om::Validations
  extend ActiveSupport::Concern

  def valid?
    @errors = []
    validate
    errors.empty?
  end

  def invalid?
    !valid?
  end

  def errors
    @errors ||= []
  end

  def add_error(error)
    @errors << error
  end

  def remove_error(error)
    @errors.delete(error)
  end

  def validate; end

  module ClassMethods
    def validate(&block)
      define_method(:validate, &block)
    end
  end
end
