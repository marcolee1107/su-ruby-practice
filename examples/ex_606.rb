# 當SketchUp遇見Ruby － 邁向程式化建模之路（碁峯出版）
# http://books.gotop.com.tw/v_AEC009100
# ex_606.rb - 對特定邊線開啟柔化平滑功能

# 建立立方體
ent = Sketchup.active_model.entities
face = ent.add_face [-5, -5, 5], [-5, 5, 5], [5, 5, 5], [5, -5, 5]
face.pushpull 10

# 對+x軸座標上的邊線柔化平滑邊線
ent.each do |entity|
if entity.typename == "Edge" && entity.start.position.x > 0 && entity.end.position.x > 0
  entity.smooth = true
end
end