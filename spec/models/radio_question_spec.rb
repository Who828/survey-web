require 'spec_helper'

describe RadioQuestion do
  it { should have_many(:options) }
end