# 當SketchUp遇見Ruby － 邁向程式化建模之路（碁峯出版）
# http://books.gotop.com.tw/v_AEC009100
# ex_911.rb - 拆解接收的資料，繪出矩形

# 建立WebDialog並載入HTML檔案
face_wd = UI::WebDialog.new "建立Face物件"
face_wd.set_size 400, 300
path = Sketchup.find_support_file "mytest/ex_912.html", "Plugins"
face_wd.set_file path

# 處理WebDialog的callback
face_wd.add_action_callback("create_face") { |d, arg|
  if arg.to_s.length == 0
    puts "無效的輸入。座標必須是有效的值。"
  else
    v = arg.to_s.split(",")
    pt1=[v[0].strip.to_f, v[1].strip.to_f, v[2].strip.to_f]
    pt2=[v[3].strip.to_f, v[4].strip.to_f, v[5].strip.to_f]
    pt3=[v[6].strip.to_f, v[7].strip.to_f, v[8].strip.to_f]
    pt4=[v[9].strip.to_f, v[10].strip.to_f, v[11].strip.to_f]

    Sketchup.active_model.entities.add_face pt1, pt2, pt3, pt4

  end }

# 顯示WebDialog
if RUBY_PLATFORM.index "darwin"
  face_wd.show_modal
else
  face_wd.show
end