# 當SketchUp遇見Ruby － 邁向程式化建模之路（碁峯出版）
# http://books.gotop.com.tw/v_AEC009100
# ex_1004.rb - 切換不同設定的場景並展現轉換效果

mod = Sketchup.active_model
mod.rendering_options["BackgroundColor"]=[127, 255, 127]
ents = mod.entities

# 建立立方體
cube1 = ents.add_group
cube1.name = "立方體"
face1 = cube1.entities.add_face [-5, 5, 0], [5, 5, 0], [5, -5, 0], [-5, -5, 0]
face1.pushpull -15
cube1.material = "Yellow"

# 建立兩圖層
layers = Sketchup.active_model.layers
layer1 = layers.add "圓柱體層"
layer2 = layers.add "立方體層"

# 建立圓柱體在 Layer 1
mod.active_layer = layer1   # 切換作用中圖層為 layer1
cyl = ents.add_group  # 使用 add_group 方法建立新群組
cyl.name = "圓柱體"    # 為新群組命名
circle = cyl.entities.add_circle [-18, 0, 0], [0, 0, -1], 6
circle_face = cyl.entities.add_face circle
circle_face.pushpull -12
cyl.material = "Red"

# 建立立方體在 Layer 2
mod.active_layer = layer2   # 切換作用中圖層為 layer2
cube2 = ents.add_group
cube2.name = "立方體"
face2 = cube2.entities.add_face [15, 2.5, 0], [20, 2.5, 0], [20, -2.5, 0], [15, -2.5, 0]
face2.pushpull -20
cube2.material = "Blue"

# 取得場景及目前時間
pages = mod.pages
now = Time.now
puts now

# 建立第一個場景，顯示陰影，時間設為現在
page1 = pages.add "第一場"
page1.shadow_info["DispalyShadows"] = true
page1.shadow_info["ShadowTime"] = now


# 建立照像機供第二場景使用
eye = [200, 300, 100]
target = [0, 0, 0]
up = [0, 0, 100]
my_cam = Sketchup::Camera.new eye, target, up
view = mod.active_view
view.camera = my_cam

# 建立第二個場景，顯示陰影時間6小時後，隱藏layer1
page2 = pages.add "第二場"
page2.shadow_info["DisplayShadows"] = true
page2.shadow_info["ShadowTime"] = now + (60*60*6)
page2.set_visibility layer1, false  # layer1 隱藏
page2.set_visibility layer2, true   # layer2 可見

# 建立第三個場景，顯示陰影時間18小時後，隱藏layer2
page3 = pages.add "第三場"
page3.shadow_info["DisplayShadows"] = true
page3.shadow_info["ShadowTime"] = now + (60*60*18)
page3.set_visibility layer1, true
page3.set_visibility layer2, false

# 切換到第一場
pages.selected_page = page1
