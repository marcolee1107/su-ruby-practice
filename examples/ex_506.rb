# 當SketchUp遇見Ruby － 邁向程式化建模之路（碁峯出版）
# http://books.gotop.com.tw/v_AEC009100
# ex_506.rb - 套用同時擁有材質及顏色的材料物件

mod = Sketchup.active_model
ent = mod.entities
mat = mod.materials

# 建立新材料
mix_mat = mat.add "材質混顏色"

# 設定材質及顏色
mix_mat.texture = Sketchup.find_support_file "images/iron.jpg", "Plugins"
mix_mat.color = "LightYellow"

# 繪出face表面並設定材料
face = ent.add_face [0, 0, 1], [100, 0, 1], [100, 100, 1], [0, 100, 1]
face.material = mix_mat

# 傳回材質平均顏色
UI.messagebox "材料平均顏色的RGB值是：" + mix_mat.texture.average_color.to_s +
                  "\n" + "材料型式是：" + mix_mat.materialType.to_s
