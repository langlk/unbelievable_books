require 'rails_helper'

describe Order do
  it { should belong_to :account }
  it { should validate_presence_of :account }
  it { should validate_presence_of :price_total }
  it { should validate_presence_of :status }
  it { should validate_presence_of :raincheck }
end
