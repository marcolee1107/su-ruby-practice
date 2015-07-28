# 當SketchUp遇見Ruby － 邁向程式化建模之路（碁峯出版）
# http://books.gotop.com.tw/v_AEC009100
# ex_401.rb - 取得六邊形所有邊線

mod = Sketchup.active_model
ent = mod.active_entities
origin = [0, 0, 0]
normal = [0, 0, 1]
radius = 10

# 建立多邊形到實體容器
polygon = ent.add_ngon origin, normal, radius, 6
entity1 = ent[1]    # 隨便取得一個實體

# 使用all_connected方法取得所有實體物件的陣列並顯示在訊息方塊中
edges = entity1.all_connected
UI.messagebox edges.to_s # 將陣列轉為字串做為訊息內容
