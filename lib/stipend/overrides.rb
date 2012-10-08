module Stipend
  module Overrides
    def override_inherited_model_name(overridden_model_name_class)
      class_eval <<-SOMETEXT
        def self.inherited(child)
          child.instance_eval do
            def model_name
              ::#{overridden_model_name_class}.model_name
            end
          end

          super
        end
      SOMETEXT
    end
  end
end
