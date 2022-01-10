#rails g rspec:request messages

require 'rails_helper'

RSpec.describe "MessagesController", type: :request do

  describe "GET paths" do
    it "index_path works" do
      get messages_path
      expect(response).to have_http_status(200)
    end

    it "new_path works" do
      get root_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET show" do
    it "message_path works" do
      message = create(:message)
      get message_path(message.auth_token)
      expect(response).to have_http_status(200)
      expect(message.lifetime).to eq 3
    end
  end

end
