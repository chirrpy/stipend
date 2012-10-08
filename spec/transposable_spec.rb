require 'spec_helper'

class TestType < ActiveRecord::Base
  include Stipend

  validates_numericality_of :foo
end

class AlphaTestType < TestType
end

class BetaTestType < TestType
end

describe Stipend::Transposable do
  describe '.update_type_and_attributes' do
    let(:alpha_type) { AlphaTestType.create(:foo => 1, :bar => 'qux') }
    let(:beta_type)  { BetaTestType.create( :foo => 1, :bar => 'qux') }

    context 'can start with one type' do
      it 'can set attributes without changing the type' do
        converted_type = TestType.update_type_and_attributes(:object      => alpha_type,
                                                             :new_type    => '',
                                                             :attributes  => {:foo => 1})

        TestType.find(alpha_type.id).should eql converted_type

        converted_type.should be_a AlphaTestType
        converted_type.foo.should eql 1
      end

      it 'converts it to another type if it has valid parameters' do
        converted_type = TestType.update_type_and_attributes( :object      => alpha_type,
                                                              :new_type    => 'BetaTestType',
                                                              :attributes  => {:foo => 1})

        TestType.find(alpha_type.id).should eql converted_type

        converted_type.should be_a BetaTestType
        converted_type.foo.should eql 1
      end

      it 'does not convert it to another type if the resulting object is not valid' do
        converted_type = TestType.update_type_and_attributes( :object      => alpha_type,
                                                              :new_type    => 'BetaTestType',
                                                              :attributes  => {:foo => 'bar'})

        stored_type = TestType.find(alpha_type.id)
        stored_type.should be_a AlphaTestType
        stored_type.foo.should eql '1'
      end

      it 'is the invalid object if the updated object is not valid' do
        converted_type = TestType.update_type_and_attributes( :object      => alpha_type,
                                                              :new_type    => 'BetaTestType',
                                                              :attributes  => {:foo => 'bar'})

        converted_type.should be_a BetaTestType
        converted_type.foo.should eql 'bar'
      end

      it 'leaves attributes other than those passed in alone' do
        converted_type = TestType.update_type_and_attributes( :object      => alpha_type,
                                                              :new_type    => 'BetaTestType',
                                                              :attributes  => {:foo => 2})

        converted_type.should be_a BetaTestType
        converted_type.foo.should eql 2
        converted_type.bar.should eql 'qux'
      end
    end
  end
end
