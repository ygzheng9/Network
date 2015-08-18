namespace :db do
  task init_1: :environment do
    Material.create!(code: "100538569", desc: "燃气透平备件\\氮气吹扫系统\\YLQ-043\\J0410")
    Material.create!(code: "100088457", desc: "其他化工材料\\石灰石粉\\250MESH  ")
    Material.create!(code: "100023915", desc: "电流变送器\\FPA-A2-F1-P2-03   ")
    Material.create!(code: "100002118", desc: "柴油\\0# ")
    Material.create!(code: "100230065", desc: "尿素\\50KG")
    Material.create!(code: "100114551", desc: "生石灰粉\\250\\一等品")
  end
end