
require "rails_helper"

RSpec.describe "Posts", type: :request do

    describe "GET: /Posts" do
        before { get "/post" }

        it "is expected to respond with OK" do
            payload = JSON.parse(response.body)
    
            expect(payload).to be_empty
            expect(response).to have_http_status(200)
        end
    
        describe "with data in the DB" do
            let(:posts) { create_list(:post) }

            it "is expected to return with all published posts" do
                before { get "/post" }

                payload = JSON.parse(response.body)

                expect(payload.size).to eq(posts.size)
                expect(response).to have_http_status(200)
            end
        end
    end

    describe "GET /posts/" do
        let(:posts) { create_list(:post, 10, published: true) }

        it "is expected to return with all published posts" do
            before { get "/post" }

            payload = JSON.parse(response.body)

            expect(payload).not_to be_empty
            expect(payload["id"]).be eq(post.id)
            expect(response).to have_http_status(200)
        end
    end
end
