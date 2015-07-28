# 當SketchUp遇見Ruby － 邁向程式化建模之路（碁峯出版）
# http://books.gotop.com.tw/v_AEC009100
# ex_507.rb - 將使用的材質透過 TextWriter 儲存到外部檔案

mod = Sketchup.active_model
ent = mod.entities
mat = Sketchup.active_model.materials

face1 = ent.add_face [10, -10, 1], [10, 10, 1], [-10, 10, 1], [-10, -10, 1]
face2 = ent.add_face [12, -10, 1], [32, -10, 1], [32, 10, 1], [12, 10, 1]

# 為二個Face表面建立二個材料
mat1 = mat.add "Mat1"
mat2 = mat.add "Mat2"
mat1.texture = Sketchup.find_support_file "images/wood.jpg", "Plugins"
mat2.texture = Sketchup.find_support_file "images/iron.jpg", "Plugins"
mat2.color="LightYellow"    # 直接使用顏色名稱
face1.material = mat1
face2.material = mat2

# 建立texture writer
twriter = Sketchup.create_texture_writer
twriter.load face1, true    # 處理正面
twriter.load face2, true    # 處理正面
path = Sketchup.find_support_file "mytest", "Plugins"
twriter.write_all path, true
