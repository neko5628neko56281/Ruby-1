require 'csv'

def create_memo
  print "拡張子を除いたファイルを入力してください: "
  file_name = gets.chomp

  print "メモしたい内容を記入してください\n完了したら Ctrl + D をおします\n"
  contents = STDIN.read.chomp

  CSV.open("#{file_name}.csv", 'w') do |csv|
    csv << [contents]
  end

  puts "メモが保存されました。"
end

def edit_memo
  print "編集したいファイルを入力してください: "
  file_name = gets.chomp

  if File.exist?("#{file_name}.csv")
    print "メモしたい内容を記入してください\n完了したら 
    を入力してください\n"
    contents = STDIN.read.chomp

    CSV.open("#{file_name}.csv", 'w') do |csv|
      csv << [contents]
    end

    puts "メモを編集しました。"
  else
    puts "指定されたファイルは存在しません。"
  end
end

def run
  loop do
    puts "メモアプリ"
    puts "1. 新規メモを作成する"
    puts "2. 既存のメモを編集する"
    puts "3. 終了する"
    print "選択してください: "
    choice = gets.chomp.to_i

    case choice
    when 1
      create_memo
    when 2
      edit_memo
    when 3
      break
    else
      puts "無効な選択です。"
    end

    puts ""
  end
end

run
