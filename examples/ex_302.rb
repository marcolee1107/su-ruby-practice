# 當SketchUp遇見Ruby － 邁向程式化建模之路（碁峯出版）
# http://books.gotop.com.tw/v_AEC009100
# ex_302.rb - 計算選取的物件有多少邊線

# 計算多少邊線被選取
mod = Sketchup.active_model
sel = mod.selection

edge_count = 0

# 在selection中尋找特定的實體
sel.each { |entity|
  if entity.is_a? Sketchup::Edge
    edge_count = edge_count + 1
  end
}

UI.messagebox("已選取 " + edge_count.to_s + " 個邊線（Edge）。")

