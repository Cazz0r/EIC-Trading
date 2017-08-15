require 'active_model_serializers'
#require 'tire/model/active_model_serializer/serializer_support'

#Tire::Results::Collection.send(:include, ActiveModel::ArraySerializerSupport)
#Tire::Results::Item.send(:include, ActiveModel::SerializerSupport)
#Tire::Results::Item.send(:include, Tire::Model::SerializerSupport)

ActiveSupport.on_load(:active_model_serializers) do
  ActiveModel::Serializer.root = false
  ActiveModel::ArraySerializer.root = false
end
