# 當SketchUp遇見Ruby － 邁向程式化建模之路（碁峯出版）
# http://books.gotop.com.tw/v_AEC009100
# ex_706.rb - 建立及刪除檔案和資料夾

# 建立資料夾和檔案
Dir.mkdir "mydir"
File.new("./mydir/colors.txt", "w+").close
File.new("./mydir/docs.txt", "w+").close
File.new("./mydir/images.txt", "w+").close

puts "現在的工作目錄是：" + Dir.pwd      # 顯示工作中資料夾

# 建立Dir物件和矩陣
my_dir = Dir.new "mydir"
arr = my_dir.entries                  # 用entries方法取出資料夾內容
puts "用 entries 方法取出資料夾內容：" + arr.to_s

# 取得內含資料夾和檔案名稱的File物件
file_array=[]
my_dir.each {|file|
    if file[0].chr != "."
        file_array << File.new("./mydir/"+file)
    end
}

# 印出資料夾及檔案名稱
file_array.each {|file| puts "資料夾及檔案名稱："+file.path}

# 關閉和刪除檔案
file_array.each {|f|
    filename = f.path
    f.close
    File.delete filename
    puts "右列檔案已刪除 "+ filename
}

# 關閉和刪除資料夾
my_dir.close
Dir.rmdir "mydir"
