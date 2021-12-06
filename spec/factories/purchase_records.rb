FactoryBot.define do
  factory :purchase_record do
    postal_code {'123-4567'}
    prefecture_id {2}
    city {'大阪市'}
    address {1-1}
    building {'ハイツ102'}
    telephone_number {'00000000000'}
  end
end
