# 當SketchUp遇見Ruby － 邁向程式化建模之路（碁峯出版）
# http://books.gotop.com.tw/v_AEC009100
# ex_411.rb - 移動邊線拉起連接的表面

mod = Sketchup.active_model
ent = mod.entities

# 建立立方體
test_face=ent.add_face [0, 0, 0], [30, 0, 0], [30, 15, 0], [0, 15, 0]
test_face.pushpull 10

# 建立切割線
roof_line = ent.add_line [15, 0, 0], [15, 15, 0]

# 建立Tranformation物件
tr = Geom::Transformation.translation [0, 0, 10]
ent.transform_entities tr, roof_line  # 套用物件轉形