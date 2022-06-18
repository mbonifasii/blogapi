module Application
    module Responder
        extend ActiveSupport::Concern
        
        def respond_with_successful payload = nil
            response = {
                :successful => true,
                :payload => payload
            }

            render status: 200, json: response.to_json
        end

    end
end