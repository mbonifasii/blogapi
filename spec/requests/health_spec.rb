
require "rails_helper"

RSpec.describe "GET: /health", type: :request do

    before { get "/health" }

    it "is expected to respond with OK" do
        payload = JSON.parse(response.body)

        expect(payload).not_to be_empty
        expect(payload["api"]).to eq("OK")
    end

    it "is expected to respond with status 200" do
        expect(response).to have_http_status(200)
    end
end



