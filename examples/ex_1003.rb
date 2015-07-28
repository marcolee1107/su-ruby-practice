# 當SketchUp遇見Ruby － 邁向程式化建模之路（碁峯出版）
# http://books.gotop.com.tw/v_AEC009100
# ex_1003.rb - 新增場景並結合場景檢查員

# 建立PagesObserver
class PgObserver < Sketchup::PagesObserver

    # 當使用者變更場景容器便產生回應
    def onContentsModified(pages)
        UI.messagebox("現在的場景是：" + pages.selected_page.label)

    end
end

# 建立名為"開麥啦"的場景
pages = Sketchup.active_model.pages
test_page1 = pages.add "開麥啦"

# 建立沒有命名的場景，再呼叫方法建立名稱及說明
test_page2 = pages.add
test_page2.name = "第二場"
test_page2.description = "這是第二個場景。"

# 將Pages物件和observer建立關聯
obs = PgObserver.new
pages.add_observer obs
