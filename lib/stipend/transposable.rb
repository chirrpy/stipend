module Stipend
  module Transposable
    module ClassMethods
      def update_type_and_attributes(options = {})
        object, new_type, attrs = options[:object], options[:new_type], options[:attributes]

        if new_type.present?
          affected_object_attributes = object.attributes.except('type').merge(attrs)
          affected_object            = new_type.constantize.new
        else
          affected_object_attributes = object.attributes.merge(attrs)
          affected_object            = object.class.new
        end

        affected_object.id           = object.id
        affected_object.attributes   = affected_object_attributes

        if affected_object.valid?
          object.before_update_type_and_attributes_delete
          object.delete
          affected_object.save
        else
          affected_object.instance_variable_set(:@new_record, object.new_record?)
        end

        affected_object
      end
    end

    def self.included(base)
      base.extend ClassMethods
    end

    def before_update_type_and_attributes_delete
    end
  end
end
