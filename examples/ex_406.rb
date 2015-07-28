# 當SketchUp遇見Ruby － 邁向程式化建模之路（碁峯出版）
# http://books.gotop.com.tw/v_AEC009100
# ex_406.rb - 用 followme方法 建立三維立方體

mod = Sketchup.active_model
ent = mod.entities
depth = 10;  width = 10  # 用分號區隔，可寫成一行

pts = []
pts[0] = [0, 0, 0]
pts[1] = [width, 0, 0]
pts[2] = [width, depth, 0]
pts[3] = [0, depth, 0]

# 建立矩形表面
test_face = ent.add_face pts

# 建立跟隨路徑
point1=[0, 0, 0];  point2=[0, 0, 10]
line = ent.add_line point1, point2
test_face.followme line
