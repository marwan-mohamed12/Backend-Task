module ApiHelpers
  def json
    JSON.parse(response.body).deep_symbolize_keys
  end

  def response_data
    response_json[:data]
  end

  def response_errors
    response_json[:errors]
  end
end
