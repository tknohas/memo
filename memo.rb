require "csv" # CSVファイルを扱うためのライブラリを読み込んでいます
 
puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"

memo_type = gets.to_i # ユーザーの入力値を取得し、数字へ変換しています

# if文を使用して続きを作成していきましょう。
# 「memo_type」の値（1 or 2）によって処理を分岐させていきましょう。

if memo_type == 1
    puts "拡張子を除いたファイルを入力してください" 
    file_name = gets.chomp
    
    p "メモしたい内容を記入してください。"
    p "終了後、Ctrl + Dを押します。"
    input_memo = readlines
    
    CSV.open("#{file_name}.csv", "w") do |csv|
        csv << ["#{input_memo}"]
    end

elsif memo_type == 2
    puts "既存のメモを編集します"
    puts "拡張子を除いたファイルを入力してください"
    
    file_name = gets.chomp
    
    p "メモを編集できます"
    p "完了したらCtrl + Dを押します"
    input_memo = readlines
    
    CSV.open("#{file_name}.csv", "a") do |csv|
        csv << ["#{input_memo}"]
    end

else 
    puts "1か2の数字を選択してください"
end
