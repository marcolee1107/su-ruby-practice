# 當SketchUp遇見Ruby － 邁向程式化建模之路（碁峯出版）
# http://books.gotop.com.tw/v_AEC009100
# ex_408.rb - 利用數學函數計算出跟隨路徑，繪出圓柱彎管

mod = Sketchup.active_model
ent = mod.entities

pt0 = Array.new   # 用來接收新建的點座標
pt1 = Array.new(3, 0)   # 用來暫存點座標

# 取得136個點座標
for i in 0..135
  pt = [pt1.x+i, pt1.y+100*Math::sin(i.degrees), pt1.z]
  pt0 << pt
end

# 建立曲線用來做為路徑
curve_path = ent.add_curve pt0

# 建立欲跟隨的表面
circle = ent.add_circle [0, 0, 0], [1, 1, 0], 5
circle_face = ent.add_face circle

# 拉成圓柱體彎管
circle_face.followme curve_path
ent.erase_entities curve_path   # 刪除路徑
