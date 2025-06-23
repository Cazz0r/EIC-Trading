class Api::V1::TestimonialSerializer < Api::V1::ModelSerializer
  attributes :content, :order_id, :account_id
end