require 'spec_helper'

describe User do
  describe "validations" do
    let(:user) { FactoryGirl.create(:user) }
    
    it "validates uniqueness of email" do
      invalid_user = FactoryGirl.build(:user, email: user.email)
      invalid_user.should have(1).error_on(:email) 
    end

    it "validates presence of email" do
      invalid_user = FactoryGirl.build(:user, email: nil)
      invalid_user.should have(1).error_on(:email)      
    end
  end
end
