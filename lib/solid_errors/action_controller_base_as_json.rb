module SolidErrors
  module ApplicationControllerBaseAsJson
    def as_json
      {
        params: params.to_unsafe_h,
        headers: request.env.select { |k, _v| k.start_with? "HTTP_" },
        session: request.session.to_h,
        assignments: instance_variables.map {
          "#{_1}=#{instance_variable_get(_1).inspect}"
        }
      }.as_json
    end
  end
end

::ActionController::Base.prepend SolidErrors::ApplicationControllerBaseAsJson
