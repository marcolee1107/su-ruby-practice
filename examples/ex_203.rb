# 當SketchUp遇見Ruby － 邁向程式化建模之路（碁峯出版）
# http://books.gotop.com.tw/v_AEC009100
# ex_203.rb - 分別用不同的方法繪出多邊形

mod = Sketchup.active_model # Open model
ent = mod.entities # All entities in model

normal = [0, 0, 1]
radius = 2

# 用add_ngon方法指定6個邊線
ent.add_ngon [0, 0, 0], normal, radius, 6

# 用add_circle方法指定6個線段
ent.add_circle [5, 0, 0], normal, radius, 6

# 用add_ngon方法指定24個邊線
ent.add_ngon [10, 0, 0], normal, radius, 24

# 用add_circle方法指定24個線段（線段數量可省略）
ent.add_circle [15, 0, 0], normal, radius
