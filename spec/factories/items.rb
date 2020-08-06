FactoryBot.define do
  
  factory :item do
    id              {"1"}
    name            {"テスト"}
    discription     {"テスト"}
    price           {"5000"}
    imageurl        {"https://thumbnail.image.rakuten.co.jp/@0_mall/taiyoec/cabinet/winter/4902145301942.jpg?_ex=128x128"}
    itemurl         {"https://hb.afl.rakuten.co.jp/hgc/g00s35s7.u1boj6c8.g00s35s7.u1bok7a6/?pc=https%3A%2F%2Fitem.rakuten.co.jp%2Ftaiyoec%2Fe-52-201611%2F&m=http%3A%2F%2Fm.rakuten.co.jp%2Ftaiyoec%2Fi%2F10001239%2F"}
    user_id         {"1"}
  end
end