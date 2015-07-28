# 當SketchUp遇見Ruby － 邁向程式化建模之路（碁峯出版）
# http://books.gotop.com.tw/v_AEC009100
# ex_501.rb - 建立群組，了解群組的階層關係

mod = Sketchup.active_model
ent = mod.entities

# 設定初始值

height = 60.cm  # 櫃高，輸入的數值必須由公分轉換為英吋的值
width = 42.cm   # 櫃寬
depth = 30.cm   # 櫃深
tn = 1.8.cm     # 板厚

# 建立側板

side_face = ent.add_face [0, 0, 0], [depth, 0, 0], [depth, 0, height], [0, 0, height]
side_face.pushpull tn
side_group1 = ent.add_group side_face.all_connected   # 建立側板群組

side_group2 = side_group1.copy  # 複製同規格的側板
side_group1.name = "左側板"      # 為側板命名
side_group2.name = "右側板"

tran = Geom::Transformation.translation [0, width-tn, 0]
side_group2.transform! tran   # 右側板向 +y 軸移動 width-tn 公分

side_group = ent.add_group side_group1, side_group2   # 建立上層側板群組
side_group.name="所有側板"

# 建立層板

slab_width = width-2*tn # 層板寬
slab_depth = depth-tn   # 層板深

slab_face = ent.add_face [0, 0, 0], [slab_depth, 0, 0], [slab_depth, slab_width, 0], [0, slab_width, 0]
slab_face.pushpull -tn
slab_group1 = ent.add_group slab_face.all_connected   # 建立層板群組
slab_group2 = slab_group1.copy  # 複製同規格層板
slab_group3 = slab_group1.copy  # 複製同規格層板
slab_group1.name = "上層板"
slab_group2.name = "中層板"
slab_group3.name = "下層板"

tran = Geom::Transformation.translation [0, 0, (height-tn)/2]
slab_group2.transform! tran   # 向 +z 軸移動 (height-tn)/2 公分

tran = Geom::Transformation.translation [0, 0, height-tn]
slab_group3.transform! tran   # 向 +z 軸移動 height-tn 公分

slab_group = ent.add_group slab_group1, slab_group2, slab_group3  # 建立上層層板群組
slab_group.name = "所有層板"

back_slab=ent.add_face [depth-tn, 0, 0], [depth-tn, slab_width, 0], [depth-tn, slab_width, height], [depth-tn, 0, height]
back_slab.pushpull tn/3
back_group = ent.add_group back_slab.all_connected  # 建立背板群組
back_group.name = "背板"

tween_desk = ent.add_group side_group, slab_group, back_group   # 建立最上層群組
tween_desk.name = "雙層櫃"

# t1物件執行移動到指定的座點上
t1 = Geom::Transformation.translation [depth, width, 0]

# t2物件執行逆時鐘旋轉 180 度
t2 = Geom::Transformation.rotation [0, 0, 0], [0, 0, 1], 180.degrees
tween_desk.move! t1*t2
