require 'rails_helper'

describe Account do
  it { should belong_to :user }
  it { should have_many :reviews }
  it { should validate_presence_of :user }
end
