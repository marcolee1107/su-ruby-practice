# 當SketchUp遇見Ruby － 邁向程式化建模之路（碁峯出版）
# http://books.gotop.com.tw/v_AEC009100
# ex_901.rb - 處理輸入方塊的下拉式選單

mod = Sketchup.active_model
ent = mod.entities

# 設計欄位及預設值
prompts = ["邊線數", "位置", "半徑"]
defaults = ["六邊形", "繪在XY平面", 10]

# 設計下拉式選單的選項
segment = ["六邊形", "七邊形", "八邊形", "圓形"]
axis = ["繪在XY平面", "繪在YZ平面", "繪在XZ平面"]
enums = [segment.join("|"), axis.join("|"), ""]

# 呼叫輸入方塊等待使用者輸入
results = inputbox prompts, defaults, enums, "繪製什麼多邊形？"

case results[1] # 依位置選擇指定normal值 
  when axis[0]; normal = [0,0,1]
  when axis[1]; normal = [1,0,0]
  when axis[2]; normal = [0,1,0] 
end
case results[0] # 依邊線數選擇畫多邊形 
  when segment[0] 
    circle = ent.add_circle [0,0,0], normal, results[2], 6
  when segment[1]
    circle = ent.add_circle [0,0,0], normal, results[2], 7
  when segment[2]
    circle = ent.add_circle [0,0,0], normal, results[2], 8
  when segment[3]
    circle = ent.add_circle [0,0,0], normal, results[2], 72
end