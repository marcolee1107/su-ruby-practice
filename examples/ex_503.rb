# 當SketchUp遇見Ruby － 邁向程式化建模之路（碁峯出版）
# http://books.gotop.com.tw/v_AEC009100
# ex_503.rb - 建立元件實例及獨立的元件

mod = Sketchup.active_model
ent = mod.active_entities

def_list = mod.definitions
path = Sketchup.find_support_file "cube.skp", "Components"
comp_def = def_list.load path   # 載入元件定義

# 建立元件實例
inst1 = ent.add_instance comp_def, [0, 0, 0]
# inst1.definition.name="元件實例"
inst1.name = "元件實例"
UI.messagebox "沒有使用make_unique的元件是：" + inst1.definition.name

# 建立獨立的元件實例
inst2 = ent.add_instance comp_def, [12, 0, 0]
inst2.name = "獨立元件實例"
inst2.make_unique
UI.messagebox "使用make_unique的元件是：" + inst2.definition.name
