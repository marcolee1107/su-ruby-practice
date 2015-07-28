# 當SketchUp遇見Ruby － 邁向程式化建模之路（碁峯出版）
# http://books.gotop.com.tw/v_AEC009100
# ex_605.rb - 取得容器內所有物件的端點

# 建立立方體
ent = Sketchup.active_model.entities
face = ent.add_face [1, 1, 1], [6, 1, 1], [6, 6, 1], [1, 6, 1]
face.pushpull 5

# 取得實體容器進行迭代，取得立方體端點
vertex_array = []
ent.each do |entity|  # 使用do區塊開始
  if entity.typename == "Edge"  # 是邊線才進入執行下一行程式
    vertex_array = vertex_array | entity.vertices
  end
end
vertex_array.each { |pt| puts "立方體的端點：" + pt.position.to_s }

