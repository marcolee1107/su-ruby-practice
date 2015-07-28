# 當SketchUp遇見Ruby － 邁向程式化建模之路（碁峯出版）
# http://books.gotop.com.tw/v_AEC009100
# ex_602.rb - 按現在的月份判斷季節

m = Time.new.month  # 取得現在的月份

case m
  when 2..4;  UI.messagebox "現在是春天"
  when 5..7;  UI.messagebox "現在是夏天"
  when 8..10; UI.messagebox "現在是秋天"
else UI.messagebox "現在是冬天"
end