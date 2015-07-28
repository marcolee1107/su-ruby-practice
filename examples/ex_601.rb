# 當SketchUp遇見Ruby － 邁向程式化建模之路（碁峯出版）
# http://books.gotop.com.tw/v_AEC009100
# ex_601.rb - 判斷物件是否成功建立

mod = Sketchup.active_model
ent = mod.active_entities
depth = 100
width = 100

pts = []
pts[0] = [0, 0, 0]
pts[1] = [width, 0, 0]
pts[2] = [width, depth, 0]
pts[3] = [0, depth, 0]

# 新增Face物件到模型中的實體容器
face = ent.add_face pts
if (face)
  UI.messagebox "成功新增 Face 物件:" + face.to_s
else
  UI.messagebox "新增失敗"
end