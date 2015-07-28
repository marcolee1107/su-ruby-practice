# 當SketchUp遇見Ruby － 邁向程式化建模之路（碁峯出版）
# http://books.gotop.com.tw/v_AEC009100
# ex_906.rb - 建立工具列及工具按鈕

# 建立Command物件
tool_cmd = UI::Command.new("第一個工具"){
    UI.messagebox "這是我的第一個工具按鈕！"
}

# 檢查命令。本例放水，任何狀況都可正常執行。
tool_cmd.set_validation_proc {
    true ? MF_ENABLED : MF_GRAYED
}

# 設定命令的外觀圖示
tool_cmd.small_icon = "small_icon.png"
tool_cmd.large_icon = "large_icon.png"
tool_cmd.tooltip = "在這裡放置工具按鈕提示，以提醒使用者操作秘訣。"

# 建立工具列
tool_toolbar = UI::Toolbar.new "第一工具列"
tool_toolbar.add_item tool_cmd
tool_toolbar.show
