# 當SketchUp遇見Ruby － 邁向程式化建模之路（碁峯出版）
# http://books.gotop.com.tw/v_AEC009100
# ex_1002.rb - 變更你看視景的位置

# 設定camera屬性，建立camera物件
eye = [100, 100, 300]
target = [0, 0, 0]
up = [0, 0, 1]
my_cam = Sketchup::Camera.new eye, target, up

# 建立Camera物件指定目前視景採用建立的照像機

view = Sketchup.active_model.active_view
view.camera = my_cam
