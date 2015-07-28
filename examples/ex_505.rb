# 當SketchUp遇見Ruby － 邁向程式化建模之路（碁峯出版）
# http://books.gotop.com.tw/v_AEC009100
# ex_505.rb - 顏色綜合範例，為元件實例運輸車上色

mod = Sketchup.active_model
ent = mod.active_entities

# 載入外部的元件定義 Truck Delivery.skp
path = Sketchup.find_support_file "Truck Delivery.skp", "Components/Components Sampler/"
def_list = mod.definitions
com_def = def_list.load path

# 建立運輸車元件實例
truck1 = ent.add_instance com_def, [0, 0, 0]

# 取得材料容器
mats = mod.materials

truck1_color = mats.add "火艷紅"   # 新增材料
truck1_color.color = [255, 0, 0]  # 定義材料顏色
truck1.material = truck1_color    # 套用材料

# 準備混色的材料物件
blue = Sketchup::Color.new 0, 0, 255
green = Sketchup::Color.new 0, 255, 0

# 建立第二個運輸車實例
truck2 = ent.add_instance com_def, [150, 0, 0]

# 混色藍綠各半
truck2_color = Sketchup::Color.blend blue, green, 0.5

# 套用材料
truck2.material = truck2_color