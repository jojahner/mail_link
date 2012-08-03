require 'spec_helper'

describe Mail do
  let(:mail) do
    Mail.new content: { 
      "subject"     => "Subject", 
      "to"          => "user name <username@encapsulates.org>", 
      "from"        => "user1 <user1:@example.com>",
      "text"        => "BODY",
    }
  end

  describe "#from" do
    it "returns the from value" do
      mail.from.should eql "user1 <user1:@example.com>"
    end
  end

  describe "#to" do
    it "returns the to value" do
      mail.to.should eql "user name <username@encapsulates.org>"
    end
  end

  describe "#subject" do
    it "returns the subject value" do
      mail.subject.should eql "Subject"
    end
  end

  describe "#text" do
    it "returns the text value" do
      mail.text.should eql "BODY"
    end
  end
end
