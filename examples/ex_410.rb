# 當SketchUp遇見Ruby － 邁向程式化建模之路（碁峯出版）
# http://books.gotop.com.tw/v_AEC009100
# ex_410.rb - 繪製三維文字

# 處理Entities容器
mod = Sketchup.active_model
ent = mod.entities

# 靠左對齊三維文字、華康儷粗黑、粗體、文字高度=10、tolerance=10、Z軸0、實心字、文字深度=10
string1 = "愛上SketchUp Ruby"
ent.add_3d_text string1, TextAlignLeft, "華康儷粗黑", true, false, 10, 10, 0, true, 10
ent.transform_entities [0, 30, 0], ent.to_a

# 文字置中對齊、字型華康儷粗黑、文字高度=10、tolerance=100(此值愈大品質愈差)、實心字、文字深度=5
string2 = "這段文字是採用華康儷粗黑,實心文字置中對齊。 \n \
容許缺陷 tolerance 值為 100。"
ent.add_3d_text string2, TextAlignCenter, "華康儷粗黑", false, false, 10, 100, 0, true, 5
ent.transform_entities [0, 40, 0], ent.to_a

# 文字靠左對齊、字型 Time New Roman、文字高度=10、tolerance=100、文字深度=10
string3 = "This text is printed in \n \
left-aligned Times New Roman \n with a tolerance of 100."
ent.add_3d_text string3, TextAlignLeft, "Times", false, false, 10, 100, 0, true, 10
ent.transform_entities [0, 60, 0], ent.to_a

# 文字靠右對齊、字型Courieer New、斜體字、文字高度=10、tolerance=10、空心字
string4 = "This text outline is printed in \n \
right-aligned, italicized \n Courier New with a tolerance of 10."
ent.add_3d_text string4, TextAlignRight, "Courier New", false, true, 10, 10, 0, false, 10
ent.transform_entities [0, 30, 0], ent.to_a