# 當SketchUp遇見Ruby － 邁向程式化建模之路（碁峯出版）
# http://books.gotop.com.tw/v_AEC009100
# ex_701.rb - 使用迭化器輸出所有使用的選項

# 輸出所有使用的選項
options_manager = Sketchup.active_model.options
options_manager.each do |options_provider|
  puts options_provider.name
  options_provider.each {|key, value|
    puts "> #{key} - #{value}"
  }
end
