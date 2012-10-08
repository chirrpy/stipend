module Stipend
  module Unprotectable
    def attributes_protected_by_default
      super.tap do |protected_columns|
        protected_columns.delete inheritance_column
      end
    end
  end
end
