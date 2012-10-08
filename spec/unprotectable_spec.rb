require 'spec_helper'

class TestType < ActiveRecord::Base
  include Stipend
end

class AlphaTestType < TestType
end

class BetaTestType < TestType
end

describe Stipend::Unprotectable do
  describe 'attributes_protected_by_default' do
    let(:alpha_type) { AlphaTestType.create(:foo => 1, :bar => 'qux') }

    it 'allows the type attribute to be mass assigned' do
      alpha_type.attributes = {:type => 'BetaTestType', :foo => 2}

      alpha_type.foo.should   eql 2
      alpha_type.type.should  eql 'BetaTestType'
    end
  end
end
