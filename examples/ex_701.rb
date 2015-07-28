# 當SketchUp遇見Ruby － 邁向程式化建模之路（碁峯出版）
# http://books.gotop.com.tw/v_AEC009100
# ex_701.rb - 建立屬性字典、key及value並將其印出

# 建立群組並設定屬性
mod = Sketchup.active_model
ent = mod.entities
car = ent.add_group

car.set_attribute "car_dict", "輪胎數量", 4
car.set_attribute "car_dict", "座位數量", 2
car.set_attribute "car_dict", "傳動系統", "手排"
car.set_attribute "car_dict", "安全氣囊", 2
car.set_attribute "maintenance", "保養日期", ""   # 未賦值也應給一初始值

# 存取 AttributeDictionaries 物件
ad = car.attribute_dictionaries
puts "屬性字典數量：" + ad.to_a.length.to_s

# 存取 AttributeDictionary 物件
dict = car.attribute_dictionary "car_dict"
puts "\n展示car_dict屬性字典"
print "\n屬性名稱："
dict.keys.each {|k| print k + " "}    # 印出所有屬性的key
print "\n屬性內容："
dict.values.each {|v| print v.to_s + " "} # 印出所有屬性的value
puts "\n字典紀錄筆數：" + dict.size.to_s
puts "\n所有屬性紀錄：\n"
dict.each_pair {|x, y| puts "key: "+ x + ", Value: " + y.to_s}
