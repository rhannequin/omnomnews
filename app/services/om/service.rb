# frozen_string_literal: true

class Om::Service
  include Om::Validations

  class ServiceFailedError < StandardError
    attr_reader :errors

    def initialize(error)
      @error = error
      super("Service failed: #{errors.inspect}")
    end
  end

  def perform
    valid? && do_perform
    errors.count.zero?
  end

  def perform!(*args)
    perform(*args) or raise ServiceFailedError, errors
  end

  def self.perform(&block)
    define_method(:do_perform, &block)
  end

  def do_perform
    raise NotImplemented
  end
end
