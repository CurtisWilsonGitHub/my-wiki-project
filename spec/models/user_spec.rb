# ======= Schema information
#     Table Name: User
#     id: integer 
#     email: string
#     encrypted_password: string
#     reset_password_token: string
#     reset_password_sent_at: datetime 
#     remember_created_at: datetime 
#     sign_in_count: integer 
#     current_sign_in_at: datetime 
#     last_sign_in_at: datetime 
#     current_sign_in_ip: string 
#     last_sign_in_ip: string 
#     confirmation_token: string 
#     confirmed_at: datetime 
#     confirmation_sent_at: datetime 
#     created_at: datetime 
#     updated_at: datetime

require 'rails_helper'

RSpec.describe User, type: :model do

    context 'validation tests' do
        it 'ensures email presence' do
            user = create(:user)
            expect(user.email).not_to be_nil
        end
        it 'ensures password presence' do
            user = create(:user)
            expect(user.password).not_to be_nil
        end
        it 'ensures password confirmation presence' do
            user = create(:user)
            expect(user.password_confirmation).not_to be_nil
        end
    end

    context 'invalid entry tests' do
        it 'ensures email is an email' do
            user = User.new(email:"bademail", password: 'password', password_confirmation: 'password')
            expect(user).to_not be_valid
        end
        it 'ensures password is valid' do
            user = User.new(email:"bademail@email", password: 'pass', password_confirmation: 'password')
            expect(user).to_not be_valid
        end
        it 'ensures password confirmation matches password' do
            user = User.new(email:"bademail@email", password: 'password', password_confirmation: 'pass')
            expect(user).to_not be_valid
        end
    end

    context 'confirmation email sent after sign up' do

        before(:each) do
            ActionMailer::Base.delivery_method = :test
            ActionMailer::Base.perform_deliveries = true
            ActionMailer::Base.deliveries = []
        end

        it "email should be sent after sign up" do
            user = create(:user)
            expect(ActionMailer::Base.deliveries.count).to eq(1)
        end
        it "renders the reciever email" do
            user = create(:user)
            email = ActionMailer::Base.deliveries.first.to
            expect(ActionMailer::Base.deliveries.first.to.include?(user.email)).to be_truthy
        end
    end  
end


#raise .inspect