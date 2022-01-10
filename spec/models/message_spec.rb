require 'rails_helper'

RSpec.describe Message, type: :model do

  before(:each) do
    @message = build(:message)
    @message2 = create(:message)
  end

  describe "#create_&_build" do
    it "basic stuff" do
      expect(@message.report).to eq '123'
      expect(@message.auth_token).to eq nil

      expect(@message2.auth_token.length).to eq Message::SECURE_TOKEN_LENGTH
      expect(@message2.report).not_to eq '123'
      expect(@message2.report.length).to eq 130
      expect(@message2.decrypt(@message2.report, @message2.password)).to eq '123'
    end
  end

end
