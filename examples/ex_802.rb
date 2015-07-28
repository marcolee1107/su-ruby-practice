# 當SketchUp遇見Ruby － 邁向程式化建模之路（碁峯出版）
# http://books.gotop.com.tw/v_AEC009100
# ex_802.rb - 利用存取器處理初始值

class Walls
  attr_accessor :width, :height, :depth

  def initialize(w, h, d)
    @width, @height, @depth = w, h, d
  end
end
