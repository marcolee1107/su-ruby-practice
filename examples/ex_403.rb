# 當SketchUp遇見Ruby － 邁向程式化建模之路（碁峯出版）
# http://books.gotop.com.tw/v_AEC009100
# ex_403.rb - 建立矩形表面

mod = Sketchup.active_model
ent = mod.entities
depth = 50
width = 100

# 指定矩形的四個端點的座標
pt1 = [0, 0, 0]
pt2 = [width, 0, 0]
pt3 = [width, depth, 0]
pt4 = [0, depth, 0]

# 建立矩形表面
test_face = ent.add_face pt1, pt2, pt3, pt4
