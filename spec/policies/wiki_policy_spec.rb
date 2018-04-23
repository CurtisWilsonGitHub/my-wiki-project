require 'rails_helper'

describe WikiPolicy do
  subject { described_class.new(user, wiki) }

  let(:wiki) { create(:wiki) }
 
  context 'for a visitor' do
    let(:user) { nil }

    it { is_expected.to permit_action(:show) }

    it { is_expected.to forbid_actions([:create, :new, :edit, :destroy, :update]) }
 
  end

  context 'for a member' do
    let(:user) { create(:user) }

    it { is_expected.to permit_actions([:create, :new, :edit, :destroy, :update, :show]) }
   
  end

  context 'for an admin' do
    let(:user) { create(:user) }

    it { user.role = "admin" 
    is_expected.to permit_actions([:create, :new, :edit, :destroy, :update, :show]) }
  end


end