# 當SketchUp遇見Ruby － 邁向程式化建模之路（碁峯出版）
# http://books.gotop.com.tw/v_AEC009100
# ex_909.rb - 檢查並傳遞位置變動資訊，供JavaScript函數處理

# 建立EnittyObserver自訂類別
class EntObserver < Sketchup::EntityObserver

  # 當Entity變動時調用此函數
  def onChangeEntity(entity)
    f_count = 1

    # 伴隨端點位置執行JavaScript
    for v in entity.vertices
      args = "'" + v.position.x.to_s + "', '" +
          v.position.y.to_s + "', '" + v.position.z.to_s + "'"
      $wd.execute_script "setPoint" + f_count.to_s + "(" +
                             args + ")"
      f_count = f_count + 1
    end
  end

  # 當Entity被刪除時調用此函數
  def onEraseEntity(entity)
    $wd.execute_script "faceDeleted()"
  end
end

# 新增Face幾何圖形，包含Face物件及Edge物件
ents = Sketchup.active_model.entities
face = ents.add_face [0, 0, 0], [10, 0, 0], [10, 10, 0], [0, 10, 0]

# 建立和Face關聯的observer物件
obs = EntObserver.new
face.add_observer obs

# 建立WebDialog並載入指定的HTML檔案
$wd = UI::WebDialog.new "檢查並顯示端點位置"
path = Sketchup.find_support_file "mytest/ex_910.html", "plugins"
$wd.set_file path
$wd.set_size 400, 230
$wd.show
