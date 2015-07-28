# 當SketchUp遇見Ruby － 邁向程式化建模之路（碁峯出版）
# http://books.gotop.com.tw/v_AEC009100
# ex_303.rb - 格式化字串

mod = Sketchup.active_model
ent = mod.entities

geo_type = "圓形"
radius = 100.cm
segments = 12

puts "我準備要繪製半徑為 %f 英吋的 %s。" %[radius, geo_type]
print "線段數量為 %d 看起來不怎麼圓。" %segments
circle = ent.add_circle [0, 0, 0], [0, 0, 1], radius, segments
