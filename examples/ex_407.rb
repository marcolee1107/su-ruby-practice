# 當SketchUp遇見Ruby － 邁向程式化建模之路（碁峯出版）
# http://books.gotop.com.tw/v_AEC009100
# ex_407.rb - 以立方體表面邊線為路徑形成環形切邊

mod = Sketchup.active_model
ent = mod.entities

main_face = ent.add_face [0, 0, 0], [10, 0, 0], [10, 10, 0], [0, 10, 0]
main_face.pushpull -10

# 繪製一直線切角
cut = ent.add_line [0, 0, 9], [1, 0, 10]

# 以main_face的邊線做為路徑
cut.faces[0].followme main_face.edges
