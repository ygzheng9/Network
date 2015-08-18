namespace :db do
  task init_2: :environment do
    Vendor.create!(code: "1046672", name: "哈尔滨电气股份有限公司")
    Vendor.create!(code: "1035386", name: "中国石油天然气股份有限公司内蒙古呼伦贝尔销售分公司")
    Vendor.create!(code: "1004312", name: "重庆华能石粉有限责任公司")
    Vendor.create!(code: "1001535", name: "上海电气集团股份有限公司")
    Vendor.create!(code: "1001966", name: "山东华能德州电力实业总公司")
    Vendor.create!(code: "1019771", name: "成都东方凯特瑞环保催化剂有限责任公司")

    SourcingType.create!(code: "T001", name: "招投标")
    SourcingType.create!(code: "T002", name: "询比价")
    SourcingType.create!(code: "T003", name: "竞争性谈判")
    SourcingType.create!(code: "T004", name: "单一来源")
  end
end