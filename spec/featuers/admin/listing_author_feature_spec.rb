require 'rails_helper'
require 'support/macros'

RSpec.feature "Creating Authors" do
  let(:admin) {Fabricate(:admin) }
  before { sign_in_as admin}

  
end