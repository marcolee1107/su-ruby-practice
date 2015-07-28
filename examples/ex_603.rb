# 當SketchUp遇見Ruby － 邁向程式化建模之路（碁峯出版）
# http://books.gotop.com.tw/v_AEC009100
# ex_603.rb - 利用迴圈計算階梯座標繪出樓梯

# 取用現行的model和Entities
mod = Sketchup.active_model
ent = mod.entities

# 建立變數並賦予初值
stairs = 10           # 預設10階
rise = 8.cm           # 預設階高
depth = 12.cm         # 預設階深
width = 100.cm        # 預設梯寬
thickness = 3.cm      # 推拉的厚度（階梯的厚度）

# 迴圈從第1階開始到我們預設的階梯數
for step in 1..stairs

  # 從階梯的尺寸計算點座標
  x1 = 0
  x2 = width
  y1 = depth * step
  y2 = depth * (step + 1)
  z = rise * step

  # 建立四個端點，每一個點都是3個元素的陣列，包括x、y、z三軸個別的位置。
  pt1 = [x1, y1, z]
  pt2 = [x2, y1, z]
  pt3 = [x2, y2, z]
  pt4 = [x1, y2, z]

  # 使用add_face方法來建立矩形。
  new_face = ent.add_face pt1, pt2, pt3, pt4

  # 使用pushpull推拉指定的厚度
  new_face.pushpull thickness
end
