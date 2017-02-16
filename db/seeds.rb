myFile=File.open("#{Rails.public_path}/colleges.txt", 'r')

myFile.each do |line|
  College.create(name: line.chomp)
end

myFile.close

myFile=File.open("#{Rails.public_path}/question.txt", 'r')

myFile.each do |line|
	Question.create(desc: line.chomp)
end

myFile.close

myFile=File.open("#{Rails.public_path}/answer.txt", 'r')
p = 1
myFile.each do |line|
	question = Question.find(p)
  p = p+1
  question.answer = line.chomp
  question.save!
end

myFile.close
