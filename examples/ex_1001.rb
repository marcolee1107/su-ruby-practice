# 當SketchUp遇見Ruby － 邁向程式化建模之路（碁峯出版）
# http://books.gotop.com.tw/v_AEC009100
# ex_1001.rb - 取用視景資訊

view = Sketchup.active_model.active_view

# 取得繪圖視窗的尺寸
height = view.vpheight.to_s
width = view.vpwidth.to_s

# 印出視景尺寸
puts "視景尺寸：" + width + "；" + height + "。"

# 印出視景四個端點的位置
puts "上左：" + view.corner(0)[0].to_s + "，" + view.corner(0)[1].to_s + "。"
puts "上右：" + view.corner(1)[0].to_s + "，" + view.corner(1)[1].to_s + "。"
puts "下左：" + view.corner(2)[0].to_s + "，" + view.corner(2)[1].to_s + "。"
puts "下右：" + view.corner(3)[0].to_s + "，" + view.corner(3)[1].to_s + "。"

# 取得視景的中心點
center = view.center

# 印出視景中心點的座標
puts "視景中心點：" + center[0].to_s + "，" + center[1].to_s + "。"

# 繪圖原點[0,0,0]在螢幕的座標
origin = view.screen_coords [0, 0, 0]
puts "繪圖原點的位置：\n" + origin[0].to_f.to_s + "\n" + origin[1].to_f.to_s

# 印出原點上一條50像素的直線，相當於以繪圖單位計算的長度
size = view.pixels_to_model 50, [0, 0, 0]
puts "在原點上的50像素直線，相當於繪圖單位的長度：" + size.to_s
