# 當SketchUp遇見Ruby － 邁向程式化建模之路（碁峯出版）
# http://books.gotop.com.tw/v_AEC009100
# ex_204.rb - 利用 add_arc 方法繪出五邊形

mod = Sketchup.active_model # Open model
ent = mod.entities # All entities in model

# Z軸正值為上，從[0,1,0]代表的軸線起算，開始繪半徑5單位的圓弧，從0度到90度
arc1 = ent.add_arc [0, 0, 0], [0, 1, 0], [0, 0, 1], 5, 0, 90.degrees

# Z軸負值為上，從[0,1,0]代表的軸線起算，開始繪半徑10單位的圓弧，從0度到90度
arc2 = ent.add_arc [0, 0, 0], [0, 1, 0], [0, 0, -1], 10, 0, 90.degrees

# Z軸正值為上，從[0,1,0]代表的軸線起算，開始繪半徑15單位的圓弧，從0度到180度
arc3 = ent.add_arc [0, 0, 0], [0, 1, 0], [0, 0, 1], 15, 0, 180.degrees

# Z軸負值為上，從[1,1,0]代表的軸線起算，開始繪半徑15單位的圓弧，從0度到90度
arc4 = ent.add_arc [0, 0, 0], [1, 1, 0], [0, 0, -1], 15, 0, 90.degrees

# X軸正值為上，從[0,0,1]代表的軸線起算，開始繪半徑15單位的圓弧，從0度到90度
arc5 = ent.add_arc [0, 0, 0], [0, 0, 1], [1, 0, 0], 15, 0, 90.degrees
