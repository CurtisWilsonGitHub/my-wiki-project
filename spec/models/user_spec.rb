require 'rails_helper'

RSpec.describe User, type: :model do

    before(:each) do
        ActionMailer::Base.delivery_method = :test
        ActionMailer::Base.perform_deliveries = true
        ActionMailer::Base.deliveries = []
        user = FactoryGirl.create(:user)
        user.save
    end

    after(:each) do
        ActionMailer::Base.deliveries.clear
    end
  
    it 'should send an email' do
        ActionMailer::Base.deliveries.count.should == 1
    end

    
end
