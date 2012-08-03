require 'spec_helper'

describe MailsController do

  describe "POST 'create'" do
    let(:params) {
      { 
        "subject"     => "Subject", 
        "to"          => "user name <username@encapsulates.org>", 
        "from"        => "user1 <user1:@example.com>",
        "text"        => "BODY\n",
        "envelope"    => "{\"to\":[\"username@encapsulates.org\"],\"from\":\"user1@example.com\"}",
        "attachments" => "1"
      }
    }
    before { post :create, params }

    context "when sender email is known" do
      let(:user) { FactoryGirl.create(:user, email: "user1@example.com") }
      
      it "creates a new mail" do
        expect { post :create, params }.to change(user.mails, :count).by(1)
      end
    end

    context "whens sender email is unknown" do
      it "returns http success" do
        post :create, params 
        response.should be_success
      end

      it "doesen't save the mail" do
        expect { post :create, params }.not_to change(Mail, :count)
      end
    end 
  end

end
