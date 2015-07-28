# 當SketchUp遇見Ruby － 邁向程式化建模之路（碁峯出版）
# http://books.gotop.com.tw/v_AEC009100
# ex_410_win.rb - 在Windows平台繪製三維文字

# 處理 Entities 容器
mod = Sketchup.active_model
ent = mod.entities

# 靠左對齊三維文字，華康標楷體，粗體，文字高度=10，tolerance=10，z軸0，實心字，文字深度=10
string1 = "愛上SketchUp Ruby"
ent.add_3d_text string1, TextAlignLeft, "標楷體", true, false, 10, 10, 0, true, 10
ent.transform_entities [0,50,0], ent.to_a

# 文字置中對齊，字型標楷體，文字高度=10，tolerance=100（此值愈大品質愈差），實心字，文字深度=5
string4 = "這段文字是採用標楷體，實心文字置中對齊。 \n \
容許缺陷 tolerance 值為 100。"
ent.add_3d_text string4, TextAlignCenter, "標楷體", false, false, 10, 100, 0, true, 5
ent.transform_entities [0,60,0], ent.to_a

# 文字靠左對齊，字型 Time New Roman,文字高度=10，tolerance=1，文字深度=10 
string1 = "This text is printed in \n \
left-aligned Times New Roman \n with a tolerance of 1."
ent.add_3d_text string1, TextAlignLeft, "Times", false, false, 10, 1, 0, true, 10
ent.transform_entities [0,60,0], ent.to_a

# 文字靠右對齊，字型 Courieer New，斜體字，文字高度=10，tolerance=1，空心字，深度=10
string3 = "This text outline is printed in \n \
right-aligned, italicized \n Courier New with a tolerance of 1."
ent.add_3d_text string3, TextAlignRight, "Courier New", false, true, 10, 1, 0, false, 10
ent.transform_entities [0,30,0], ent.to_a
