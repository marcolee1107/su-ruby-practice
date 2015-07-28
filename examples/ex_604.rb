# 當SketchUp遇見Ruby － 邁向程式化建模之路（碁峯出版）
# http://books.gotop.com.tw/v_AEC009100
# ex_604.rb - 傳回容器中的face物件

# 建立測試的Face物件
ent = Sketchup.active_model.entities
face = ent.add_face [1, 1, 1], [11, 1, 1], [11, 11, 1], [1, 11, 1]
face.pushpull 10

# 尋找Face物件中向量為+X軸的面
xface = ent.find { |ent| ent.typename == "Face" && ent.normal == [1, 0, 0] }
UI.messagebox "向量為+X軸的面是：" + xface.to_s
