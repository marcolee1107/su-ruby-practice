# 當SketchUp遇見Ruby － 邁向程式化建模之路（碁峯出版）
# http://books.gotop.com.tw/v_AEC009100
# ex_905.rb - 用Command概念改寫程式碼9-3

# 建立Command物件
cmd = UI::Command.new("表面塗上綠色") {
  sel = Sketchup.active_model.selection
  sel.each do |entity|
    entity.material = [0, 255, 0]
  end
}

# 檢查是否為Face物件
cmd.set_validation_proc {
  sel = Sketchup.active_model.selection
  face = sel.find { |entity| entity.typename == "Face" }
  face ? MF_ENABLED : MF_GRAYED
}

# 建立立方體，立方體有6個面，可用來作為測試
face=Sketchup.active_model.entities.add_face [1, 1, 1], [12, 1, 1], [12, 12, 1], [1, 12, 1]
face.pushpull 11

# 設計快顯功能表
UI.add_context_menu_handler do |menu|
  # 新增分隔線及功能項目
  menu.add_separator
  menu.add_item cmd
end
