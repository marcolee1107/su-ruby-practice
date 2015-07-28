# 當SketchUp遇見Ruby － 邁向程式化建模之路（碁峯出版）
# http://books.gotop.com.tw/v_AEC009100
# ex_404.rb - 從矩形表面取得端點

mod = Sketchup.active_model
sel = mod.selection

# 取得被選取表面的四個端點，傳回陣列儲存於變數中
vertices = sel[0].vertices

# 依順序顯示端點座標
UI.messagebox "第一個端點：" + vertices[0].position.to_s + "\n" +
                  "第二個端點："+vertices[1].position.to_s + "\n" +
                  "第三個端點："+vertices[2].position.to_s + "\n" +
                  "第四個端點："+vertices[3].position.to_s
