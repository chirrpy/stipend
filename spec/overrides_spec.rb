require 'spec_helper'

class OverridesTestType < ActiveRecord::Base
  include Stipend

  override_inherited_model_name OverridesTestType.model_name
end

class OverridesAlphaTestType < OverridesTestType
end

describe Stipend::Overrides do
  describe '.override_inherited_model_name' do
    let(:alpha_type) { OverridesAlphaTestType.new(:foo => 1, :bar => 'qux') }

    describe '#model_name' do
      it 'is always the model name of the base class' do
        alpha_type.class.model_name.should eql 'OverridesTestType'
      end

      it 'is always the model name of the base class' do
        OverridesTestType.model_name.should eql 'OverridesTestType'
      end
    end
  end
end
