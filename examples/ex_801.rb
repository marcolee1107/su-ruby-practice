# 當SketchUp遇見Ruby － 邁向程式化建模之路（碁峯出版）
# http://books.gotop.com.tw/v_AEC009100
# ex_801.rb - 為Walls類別定義 width= 及 width 兩個方法

class Walls
  def width=(length)
    @width=length
  end

  def width
    @width
  end
end
