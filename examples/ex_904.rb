# 當SketchUp遇見Ruby － 邁向程式化建模之路（碁峯出版）
# http://books.gotop.com.tw/v_AEC009100
# ex_904.rb - 建立命令物件並做為功能表項目

UI.menu("Draw").add_item("觸發我定義的程序") {
  UI.messagebox("從這裡開始執行我定義的程序")
}

# 建立命令物件
cmd = UI::Command.new("測試新的命令") {
  UI.messagebox("測試命令從這裡開始執行！")
}

# 可以用cmd.menu_text=方法重新給予命令名稱
# 檢查是否有選取物件，如果沒有，功能表項目將變成灰色
cmd.set_validation_proc {
  if Sketchup.active_model.selection.length == 0
    MF_GRAYED
  else
    MF_ENABLED
  end
}

UI.menu("Draw").add_item cmd    # 將Command物件加入Draw功能表
