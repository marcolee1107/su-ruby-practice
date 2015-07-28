# 當SketchUp遇見Ruby － 邁向程式化建模之路（碁峯出版）
# http://books.gotop.com.tw/v_AEC009100
# ex_412.rb - 轉移物件的位置

mod = Sketchup.active_model
ent = mod.entities

# 建立表面
tran_face = ent.add_face [0, 0, 0], [-10, 0, 0], [-10, -10, 0], [0, -10, 0]

# 使用第一種方式建立Transformation物件，向+X軸方向轉移表面
t = Geom::Transformation.new [15, 0, 0]
ent.transform_entities t, tran_face

# 使用第二種方式建立Transformation物件，向+Y軸方向轉移表面
t = Geom::Transformation.translation [0, 12, 0]
ent.transform_entities t, tran_face

# 使用第三種方式建立Transformation物件，向-X軸方向轉移表面
ent.transform_entities [-13, 0, 0], tran_face
