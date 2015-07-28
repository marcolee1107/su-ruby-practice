# 當SketchUp遇見Ruby － 邁向程式化建模之路（碁峯出版）
# http://books.gotop.com.tw/v_AEC009100
# ex_301.rb - 取得第一個物件，及模型中使用了多少材料

mod = Sketchup.active_model
ent = mod.entities
mat = mod.materials

# 取得第一個物件的資訊，並顯示它的物件型態
first_entity = ent[0]
UI.messagebox(" 檔案中第一個物件是:" + first_entity.typename)

# 從 Materials 物件傳回資訊
number_materials = mat.length
UI.messagebox(" 檔案中使用了 " + number_materials.to_s + " 樣材料。")