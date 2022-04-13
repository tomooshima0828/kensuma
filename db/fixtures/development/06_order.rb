Business.all.each do |business|
  3.times do |n|
    Order.seed(:id,
      {
        id: n+1,
        business_id:         business.id,
        status: 0,
        site_uu_id:                SecureRandom.uuid,
        site_name:           "現場#{n+1}",
        order_name:             "発注者#{n+1}",
        order_post_code:          "123456#{n+1}",
        order_address:     "埼玉県発注市1-2-#{n+1}"
      }
    )
  end
end
