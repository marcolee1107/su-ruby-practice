# 當SketchUp遇見Ruby － 邁向程式化建模之路（碁峯出版）
# http://books.gotop.com.tw/v_AEC009100
# ex_201.rb - 繪五條直線圍成五邊形

mod = Sketchup.active_model # Open model
ent = mod.entities # All entities in model
sel = mod.selection # Current selection

=begin
上面三行是 Ruby Code Editor 預留的程式碼，為了初學方便，建議留下。
建立5個點，每一個點代表一個頂點
5個點兩兩連成直線，形成一個五邊形
=end

pt1 = [5, 0, 0]
pt2 = [1.5625, -4.75, 0]
pt3 = [-4.0625, -2.9375, 0]
pt4 = [-4.0625, 2.9375, 0]
pt5 = [1.5625, 4.758, 0]

ent.add_line pt1, pt2
ent.add_line pt2, pt3
ent.add_line pt3, pt4
ent.add_line pt4, pt5
ent.add_line pt5, pt1

# 程式結束