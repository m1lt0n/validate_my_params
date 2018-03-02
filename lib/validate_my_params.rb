require "validate_my_params/version"

module ValidateMyParams
  class MissingParam < StandardError; end
  class InvalidParam < StandardError; end

  def validate_args(data, &block)
    @_data = data
    yield self
  end

  def validate(param, type:, required:)
    param = param.to_sym

    if required && !_data.include?(param)
      raise MissingParam, "#{param} is required but was not provided"
    end

    if _data.include?(param) && !_data[param].is_a?(type)
      raise InvalidParam, "#{param} is not a #{type} as expected"
    end
  end

  private

  attr_reader :_data
end
