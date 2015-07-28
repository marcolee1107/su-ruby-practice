# 當SketchUp遇見Ruby － 邁向程式化建模之路（碁峯出版）
# http://books.gotop.com.tw/v_AEC009100
# ex_806.rb - 類別變數的實驗

class A
  @@value = 1

  def A.value;  @@value
  end

end

puts A.value  # 輸出1

class B < A;  @@value=2; end
puts A.value  # 輸出2

class C < A;  @@value=3; end
puts B.value  # 輸出3