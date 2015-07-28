# 當SketchUp遇見Ruby － 邁向程式化建模之路（碁峯出版）
# http://books.gotop.com.tw/v_AEC009100
# ex_1005.rb - 自動播放場景轉換

# 需要載入前一個範例ex_1004.rb
require "mytest/ex_1004.rb" # 如果你的檔案路徑不同，請使用你的路徑

# 設定每一個場景的轉換及延遲時間
$delay = 1
$trans_time = 2
$pages = Sketchup.active_model.pages
$pages.each do |page|
  page.delay_time = $delay;
  page.transition_time = $trans_time;
end

# 建立子功能表
view_menu = UI.menu "View"
view_menu.add_separator
sub_menu = view_menu.add_submenu("場景動畫")

# 新增子功能表項目開始動畫
$pages.selected_page = $pages[0]
start_zoom = sub_menu.add_item("開始動畫") {
  $timer = UI.start_timer($delay + $trans_time, true) {
    Sketchup.send_action "pageNext:"
  } }
# 新增子功能表項目結束動畫
start_zoom = sub_menu.add_item("結束動畫") {
  UI.stop_timer $timer
}
