require 'csv'

def create_memo
  print "メモのタイトルを入力してください: "
  title = gets.chomp
  print "メモの内容を入力してください: "
  content = gets.chomp

  CSV.open('memos.csv', 'a') do |csv|
    csv << [title, content]
  end

  puts "メモが保存されました。"
end




def edit_memo
  memos = []

  puts "編集するメモの番号を入力してください:"
  CSV.foreach('memos.csv') do |row|
    memos << row
  end

  memos.each_with_index do |memo, index|
    puts "#{index + 1}. #{memo[0]}"
  end

  print "選択してください: "
  memo_number = gets.chomp.to_i

  if memo_number > 0 && memo_number <= memos.length
    memo_to_edit = memos[memo_number - 1]

    print "新しいタイトルを入力してください (現在のタイトル: #{memo_to_edit[0]}): "
    new_title = gets.chomp
    print "新しい内容を入力してください (現在の内容: #{memo_to_edit[1]}): "
    new_content = gets.chomp

    memos[memo_number - 1] = [new_title, new_content]

    CSV.open('memos.csv', 'w') do |csv|
      memos.each do |memo|
        csv << memo
      end
    end

    puts "#{memo_to_edit[0]} のメモを編集しました。"
  else
    puts "無効な選択です。"
  end
end



def run
  loop do
    puts "メモアプリ"
    puts "1. メモを作成する"
    puts "2. メモを編集する"
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

