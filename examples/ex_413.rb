# 當SketchUp遇見Ruby － 邁向程式化建模之路（碁峯出版）
# http://books.gotop.com.tw/v_AEC009100
# ex_413.rb - 聯合轉換的應用

mod = Sketchup.active_model
ent = mod.entities

# 建立10單位立方的三維物件
test_face = ent.add_face [0, 0, 0], [10, 0, 0], [10, 10, 0], [0, 10, 0]
test_face.pushpull -10

# 分別建立比例縮放、轉移及旋轉用途的Tranformation物件
t_scal = Geom::Transformation.scaling 3, 1, 1
t_tran = Geom::Transformation.new [50, 0, 0]
t_rot = Geom::Transformation.new [50, 0, 0], [0, 0, 1], 90.degrees

# 聯合轉形物件，排在最後的物件先執行
t = t_rot * t_tran * t_scal

# 套用在三維物件上
ent.transform_entities t, test_face.all_connected
