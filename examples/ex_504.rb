# 當SketchUp遇見Ruby － 邁向程式化建模之路（碁峯出版）
# http://books.gotop.com.tw/v_AEC009100
# ex_504.rb - 取用外部的元件定義，建立並安置元件實例

mod = Sketchup.active_model
ent = mod.active_entities

# 載入元件定義
path = Sketchup.find_support_file "Couch Modern.skp", "Components/Components Sampler/"
def_list = mod.definitions
com_def = def_list.load path

# 建立Tranformation物件
tran1 = Geom::Transformation.rotation [0, 0, 0], [0, 0, 1], 90.degrees
tran2 = Geom::Transformation.translation [0, 80, 0]
tran3 = Geom::Transformation.rotation [80, 0, 0], [0, 0, 1], -90.degrees

# 新增元件實例
inst1 = ent.add_instance com_def, tran1
inst2 = ent.add_instance com_def, tran2
inst3 = ent.add_instance com_def, tran3