
require "boni_request_helper"


RSpec.describe "POST: /posts", type: :request do
    describe "Successful responses" do
        it "is expected to return with a post created successfully" do
            post_params = attributes_for(:post)
    
            post "/posts", params: { :post => post_params }
    
            is_expected_to_be_successful_response
        end
    end

    describe "Error responses" do

    end

    describe "Not found responses" do

    end

    describe "Unauthorized responses" do

    end
end

