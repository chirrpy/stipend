require 'stipend/transposable'
require 'stipend/unprotectable'
require 'stipend/overrides'
require 'stipend/version'

module Stipend
  def self.included(base)
    base.send(:include, ::Stipend::Transposable)
    base.send(:extend,  ::Stipend::Overrides)
    base.send(:extend,  ::Stipend::Unprotectable)
  end
end
