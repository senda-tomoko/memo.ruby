require "csv"

puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"

memo_type = gets.to_i

case memo_type
when 1
  puts "新規のメモを作成します。ファイル名を入力してください（拡張子除く）:"
  file_name = gets.chomp
  puts "メモの内容を入力してください。完了したらCtrl + Dを押します:"
  memo_content = readlines(chomp: true)
  CSV.open("#{file_name}.csv", "w") do |csv|
    memo_content.each do |line|
      csv << [line]
    end
  end
  puts "#{file_name}.csvに内容を保存しました。"

when 2
  puts "編集するファイル名を入力してください（拡張子除く）:"
  file_name = gets.chomp
  if File.exist?("#{file_name}.csv")
    puts "メモの内容を入力してください。完了したらCtrl + Dを押します:"
    memo_content = readlines(chomp: true)
    CSV.open("#{file_name}.csv", "a") do |csv|
      memo_content.each do |line|
        csv << [line]
      end
    end
    puts "#{file_name}.csvに内容を追記しました。"
  else  puts "指定されたファイルは存在しません。"
  end

else
  puts "不正な値です。1か2を入力してください。"
end
