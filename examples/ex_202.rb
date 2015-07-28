# 當SketchUp遇見Ruby － 邁向程式化建模之路（碁峯出版）
# http://books.gotop.com.tw/v_AEC009100
# ex_202.rb - 利用 add_curve 繪製五邊形

mod = Sketchup.active_model # Open model
ent = mod.entities # All entities in model

pt1 = [5, 0, 0]
pt2 = [1.5625, -4.75, 0]
pt3 = [-4.0625, -2.9375, 0]
pt4 = [-4.0625, 2.9375, 0]
pt5 = [1.5625, 4.758, 0]

# 指定curve變數接收傳回的物件，並繪出圖形
curve = ent.add_curve pt1, pt2, pt3, pt4, pt5, pt1

# 顯示curve的型能及長度
puts "curve是什麼？", curve.class
puts "curve的長度？", curve.length
