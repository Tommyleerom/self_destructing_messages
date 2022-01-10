require 'rails_helper'

RSpec.describe MessageJob, type: :job do
  it "Set message job to queue" do
     message = create(:message)
     expect { MessageJob.perform_later(message) }.to have_enqueued_job(MessageJob)
  end

  it "Destroy message works" do
     message = create(:message)
     expect(Message.count).to eq 1
     MessageJob.perform_now(message)
     expect(Message.count).to eq 0
  end
end
