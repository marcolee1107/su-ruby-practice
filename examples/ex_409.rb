# 當SketchUp遇見Ruby － 邁向程式化建模之路（碁峯出版）
# http://books.gotop.com.tw/v_AEC009100
# ex_409.rb - 繪甜甜圈和球體

mod = Sketchup.active_model
ent = mod.entities

# 繪甜甜圈，先在XY平面上繪圓形邊線，再建立表面
circle1 = ent.add_circle [0, -9, 0], [0, 0, 1], 4
circle_face1 = ent.add_face circle1

# 建立圓形路徑，路徑通過表面中心點
path1 = ent.add_circle [0, 0, 0], [1, 0, 0], 9
circle_face1.followme path1   # 形成甜甜圈圖形

# 繪球體，圓心在同一位置
center = [0, 20, 0]
radius = 5
circle2 = ent.add_circle center, [0, 0, 1], radius
circle_face2 = ent.add_face circle2

# 建立圓形路徑，半徑要稍微大一點，以方便最後清除路徑
path2 = ent.add_circle center, [1, 0, 0], radius+1
circle_face2.followme path2   # 形成球體
ent.erase_entities path2  # 清除路徑
