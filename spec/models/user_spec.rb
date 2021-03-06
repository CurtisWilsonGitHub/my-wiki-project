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

    let(:user) { create(:user) }

    it { is_expected.to have_many(:wikis) }



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
        it 'ensures email is valid' do
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

    

    context ' users roles ' do

        it "responds to role" do
            expect(user).to respond_to(:role)
          end
      
          it "responds to admin?" do
            expect(user).to respond_to(:admin?)
          end
      
          it "responds to member?" do
            expect(user).to respond_to(:member?)
          end
        end
     
        describe "roles" do
          it "is member by default" do
            expect(user.role).to eql("member")
          end
      
          context "member user" do
            it "returns true for #member?" do
              expect(user.member?).to be_truthy
            end
      
            it "returns false for #admin?" do
              expect(user.admin?).to be_falsey
            end
          end
      
          context "admin user" do
            before do
              user.admin!
            end
      
            it "returns false for #member?" do
              expect(user.member?).to be_falsey
            end
      
            it "returns true for #admin?" do
              expect(user.admin?).to be_truthy
            end
        end 
    end 
end


#raise .inspect