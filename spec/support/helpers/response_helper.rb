
module ResponseHelpers

    # container for the response body parsed as JSON 
    @@response_json = nil

    def response_json
        @@response_json = JSON.parse(response.body) 
        @@response_json
    end

    def is_expected_to_be_successful_response
        @@response_json = nil
        expect(response).to have_http_status(:success)
        expect(response.content_type).to eq("application/json; charset=utf-8")
        expect(response_json).to have_key("successful")
        expect(response_json["successful"]).to be_truthy
        expect(response_json).to have_key("payload")
    end

    def is_expected_to_be_error_response
        @@response_json = nil
        expect(response).to have_http_status(:error)
        expect(response.content_type).to eq("application/json; charset=utf-8")
        expect(response_json).to have_key("successful")
        expect(response_json["successful"]).to be_falsey
        expect(response_json).to have_key("error")
    end

    def is_expected_to_be_not_found_response
        @@response_json = nil
        expect(response).to have_http_status(:not_found)
        expect(response.content_type).to eq("application/json; charset=utf-8")
        expect(response_json).to have_key("successful")
        expect(response_json["successful"]).to be_falsey
        expect(response_json).to have_key("error")
    end

    def is_expected_to_be_unauthorized_response
        @@response_json = nil
        expect(response).to have_http_status(:unauthorized)
        expect(response.content_type).to eq("application/json; charset=utf-8")
        expect(response_json).to have_key("successful")
        expect(response_json["successful"]).to be_falsey
        expect(response_json).to have_key("error")
    end
end


