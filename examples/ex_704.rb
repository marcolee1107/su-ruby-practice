# 當SketchUp遇見Ruby － 邁向程式化建模之路（碁峯出版）
# http://books.gotop.com.tw/v_AEC009100
# ex_704.rb - 變更繪圖視窗中的天空及地面的顏色

rendering = Sketchup.active_model.rendering_options

# 擷取及更改 SkyColor 設定值
puts "原SkyColor: " + rendering["SkyColor"].to_s
rendering["SkyColor"] = [255, 255, 255]
puts "新SkyColor: " + rendering["SkyColor"].to_s

# 擷取及更改 GroundColor 設定值
puts "原GroundColor: " + rendering["GroundColor"].to_s
rendering["GroundColor"] = [0, 127, 0]
puts "新GroundColor: " + rendering["GroundColor"].to_s