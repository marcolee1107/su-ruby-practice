# 當SketchUp遇見Ruby － 邁向程式化建模之路（碁峯出版）
# http://books.gotop.com.tw/v_AEC009100
# ex_902.rb - 建立需檢查執行條件的功能表

def validation1 # 自訂函數檢查現在時間
  (Time.new.hour == 10) ? MF_ENABLE : MF_GRAYED
end

def validation2
  (Time.new.hour == 11) ? MF_ENABLE : MF_GRAYED
end

view_menu = UI.menu "View"
view_menu.add_separator # 新增分隔線
sub_menu = view_menu.add_submenu("名偵探柯南重播")

it1 = sub_menu.add_item("第⼀集") {
  UI.messagebox("準備播放第⼀集!")
}
it2 = sub_menu.add_item("第⼆集") {
  UI.messagebox("準備播放第⼆集!")
}

sub_menu.set_validation_proc(it1) { validation1 } # 10點允許播放
sub_menu.set_validation_proc(it2) { validation2 } # 11點允許播放
