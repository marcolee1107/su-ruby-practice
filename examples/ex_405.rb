# 當SketchUp遇見Ruby － 邁向程式化建模之路（碁峯出版）
# http://books.gotop.com.tw/v_AEC009100
# ex_405.rb - 推擠切除部分立方體

mod = Sketchup.active_model
ent = mod.entities
depth = 10; width = 10	# 用分號區隔，可寫成一行

pts = []
pts[0] = [0, 0, 0]
pts[1] = [width, 0, 0]
pts[2] = [width, depth, 0]
pts[3] = [0, depth, 0]

# 建立矩形表面
test_face = ent.add_face pts
test_face.reverse! 	# 變換方向
test_face.pushpull 10 	# 拉成三維圖形

# 在矩形表面上建立一條直線
cut_line = ent.add_line [10, 8, 10], [8, 10, 10]

cut_line.faces[1].pushpull -10 	# 由上向下推擠移除一角邊
