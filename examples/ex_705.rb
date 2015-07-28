# 當SketchUp遇見Ruby － 邁向程式化建模之路（碁峯出版）
# http://books.gotop.com.tw/v_AEC009100
# ex_705.rb - 以指定的時間及地點顯示陰影

ent = Sketchup.active_model.entities
cube = ent.add_face [25, 40, 0], [35, 40, 0], [35, 50, 0], [25, 50, 0]
cube.pushpull -10

# 取用並設定ShadowInfo物件
shadow = Sketchup.active_model.shadow_info
shadow["DisplayShadows"] = true
shadow["DisplayOnGrnundPlane"] = true

# 設定時間及位置
shadow_time = Time.now + (60*60*8)
shadow["ShadowTime"] = shadow_time
shadow["Latitude"] = 25.0440
shadow["Longitude"] = 121.5611

