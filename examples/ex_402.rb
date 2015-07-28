# 當SketchUp遇見Ruby － 邁向程式化建模之路（碁峯出版）
# http://books.gotop.com.tw/v_AEC009100
# ex_402.rb - 利用數學函數繪出曲線

mod = Sketchup.active_model
ent = mod.active_entities

pt0 = Array.new
pt1 = Array.new(3, 0)

for i in 0..135
  pt=[pt1.x+i, pt1.y+100*Math::sin(i.degrees), pt1.z]
  pt0 << pt
end

# 建立多邊形到實體容器
curve = ent.add_curve pt0
UI.messagebox curve.size    # 將陣列轉為字串做為訊息內容
