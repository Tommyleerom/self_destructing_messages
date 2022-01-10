#rails g rspec:system Messages

require 'rails_helper'

RSpec.describe "Messages", type: :system do
  before do
    driven_by(:rack_test)
  end

  it "loads the show page with the text" do
    message = create(:message)
    visit message_path(message.auth_token)
    expect(page).to have_content("To see the massage, please enter the password")
    fill_in(:password, :with => 'aaa')
    click_on "Submit"
    expect(page).to have_content("123")
    expect(message.lifetime).to eq 3

  end
end
