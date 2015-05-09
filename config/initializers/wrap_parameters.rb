ActiveSupport.on_load(:action_controller) do
  include ActionController::ParamsWrapper

  # Enable parameter wrapping for JSON
  wrap_parameters(format: [:json, :url_encoded_form])
end
