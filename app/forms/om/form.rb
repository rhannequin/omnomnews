# frozen_string_literal: true

class Om::Form
  include ActiveModel::Model
  include ActiveModel::Attributes
  include ActiveModel::Validations

  def perform
    raise NotImplementedError
  end

  def submit(params)
    self.attributes = sanitize_params(params || {})
    valid? && perform
  end

  private

  def sanitize_params(params)
    return {} if params.blank?

    # If params come from request, only permit those which match attributes
    if params.is_a?(ActionController::Parameters)
      params.slice(*self.class.attribute_names).permit!.to_h
    else
      params
    end
  end
end
