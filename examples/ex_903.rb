# 當SketchUp遇見Ruby － 邁向程式化建模之路（碁峯出版）
# http://books.gotop.com.tw/v_AEC009100
# ex_903.rb - 新增功能表項目到快顯功能表中

# 自訂函數設定選取的實體塗上綠色
def painting_color
  sel = Sketchup.active_model.selection
  sel.each do |entity|
    entity.material = [0, 255, 0]
  end
end

# 自訂函數檢查是否為Face物件
def check_face
  sel = Sketchup.active_model.selection
  face = sel.find { |entity| entity.typename == "Face" }
  face ? MF_ENABLED : MF_GRAYED
end

# 建立立方體，立方體有6個面，可用來做為測試
face=Sketchup.active_model.entities.add_face [1, 1, 1], [12, 1, 1], [12, 12, 1], [1, 12, 1]
face.pushpull 11

# 設計快顯功能表
UI.add_context_menu_handler do |menu|

  # 新增分隔線及功能項目
  menu.add_separator
  item = menu.add_item("表面塗上綠色") { painting_color }

  # 檢查選取的表面，如果是Face物件功能表項目才會正常顯示正常執行
  menu.set_validation_proc(item) { check_face }
end
