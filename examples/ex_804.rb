# 當SketchUp遇見Ruby － 邁向程式化建模之路（碁峯出版）
# http://books.gotop.com.tw/v_AEC009100
# ex_804.rb - 再為 Walls 類別定義新方法

class Walls

  # 建立實體變數和它的存取器方法
  attr_accessor :width, :height, :depth

  # 允許建立物件時接收初始化參數
  def initialize(w,h,d)
    @width, @height, @depth = w, h, d
  end

  # 在原點建立物件
  def place
  	ents=Sketchup.active_model.entities
  	pts = []
 	  pts[0] = [0, 0, 0]
 	  pts[1] = [@width, 0, 0]
 	  pts[2] = [@width, 0, @height]
 	  pts[3] = [0, 0, @height]
  	wall=ents.add_face pts	
 	  wall.pushpull -@depth
  end
 end
