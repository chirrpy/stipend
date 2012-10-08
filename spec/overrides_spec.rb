require 'spec_helper'

class TestType < ActiveRecord::Base
  include Stipend

  override_inherited_model_name TestType
end

class AlphaTestType < TestType
end

describe Stipend::Overrides do
  describe '.override_inherited_model_name' do
    let(:alpha_type) { AlphaTestType.new(:foo => 1, :bar => 'qux') }

    describe '#model_name' do
      it 'is always the model name of the base class' do
        alpha_type.class.model_name.should eql 'TestType'
      end

      it 'is always the model name of the base class' do
        TestType.model_name.should eql 'TestType'
      end
    end
  end
end
