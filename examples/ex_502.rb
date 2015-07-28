# 當SketchUp遇見Ruby － 邁向程式化建模之路（碁峯出版）
# http://books.gotop.com.tw/v_AEC009100
# ex_502.rb - 了解元件的結構

mod = Sketchup.active_model
list = mod.definitions    # 取用 DefinitionList
# 使用Model類別的 definition 方法傳回 DefinitionList

# 調用 add 方法來建立名為 立方體 的元件，它是 ComponentDefinition
comp_def = list.add "立方體"
comp_def.description = "這是一個測試的共用元件。"

ent = comp_def.entities   # 取用元件定義容器，建立立方體元件定義的內容
face = ent.add_face [0, 0, 0], [10, 0, 0], [10, 10, 0], [0, 10, 0]
face.reverse!
face.pushpull 10

# 儲存 ComponentDefinitaion 元件到指定的資料夾路徑
save_path = Sketchup.find_support_file "Components", ""
comp_def.save_as(save_path + "/cube.skp")
puts "名為立方體的元件定義已經儲存到：" + comp_def.path
