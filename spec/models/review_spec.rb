require 'rails_helper'

describe Review do
  it { should belong_to :product }
  it { should belong_to :account }
  it { should validate_presence_of :product }
  it { should validate_presence_of :account }
  it { should validate_presence_of :content }
end
