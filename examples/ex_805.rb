# 當SketchUp遇見Ruby － 邁向程式化建模之路（碁峯出版）
# http://books.gotop.com.tw/v_AEC009100
# ex_805.rb - 建立子類別，覆寫父類別的方法

require "mytest/ex_804.rb"

class BrickWalls < Walls	# 建立子類別
	
	# 覆寫Walls類別初始化方法
	def initialize(w,h)		# 只要兩個參數就可以建立物件
		@width, @height = w, h
		@depth=12.cm		# 深度為12公分
	end
	
	# 覆寫Walls類別的depth=方法
	def depth=(d)
		@depth=12.cm
		puts "不接受指定深度！"		
	end

	# 定義新方法，為BrickWalls 物件貼上磚牆外觀
	def show
  		ents=Sketchup.active_model.entities
  		pts = []
 		pts[0] = [0, 0, 0]
 		pts[1] = [@width, 0, 0]
 		pts[2] = [@width, 0, @height]
 		pts[3] = [0, 0, @height]
  		wall=ents.add_face pts		# 按深度推拉成牆的立方體
 		wall.pushpull -@depth

  		wall_group = ents.add_group wall.all_connected
  		wall_comp = wall_group.to_component		# 轉成元件

  		mats = Sketchup.active_model.materials
  		mat = mats.add "磚牆"	# 建立新的材料物件
  		mat.texture=Sketchup.find_support_file "images/Brick_Antique.jpg", "Plugins"
  		mat.texture.size=58, 37		# 設定材質圖片尺寸
  		wall_comp.material = mat 	# 套用材料材質
	end
end