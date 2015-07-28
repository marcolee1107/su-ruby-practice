# 當SketchUp遇見Ruby － 邁向程式化建模之路（碁峯出版）
# http://books.gotop.com.tw/v_AEC009100
# ex_703.rb - 變更模型屬性

# 取用OptionsManager容器
# 從容器中取用名稱為 UnitsOptions 的 OptionsProvider
opts = Sketchup.active_model.options
prov = opts["UnitsOptions"]

# 印出格式舊值，設定為第二個選項
puts "原格式設定值：" + prov["LengthFormat"].to_s
prov["LengthFormat"] = 1
puts "新格式設定值：" + prov["LengthFormat"].to_s

# 印出單位舊值，設定為第四個選項
puts "\n原單位設定值：" + prov["LengthUnit"].to_s
prov["LengthUnit"] = 3
puts "新單位設定值：" + prov["LengthUnit"].to_s

# 印出精確度舊值，設定為第二個選項
puts "\n原精確度設定值：" + prov["LengthPrecision"].to_s
prov["LengthPrecision"] = 1
puts "新精確度設定值：" + prov["LengthPrecision"].to_s
