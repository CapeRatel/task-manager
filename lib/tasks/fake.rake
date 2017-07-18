namespace :fake do
  task tasks: :environment do
    count = loop do
      puts 'Сколько задач создать?'
      c = STDIN.gets.chomp.to_i
      break c if c.is_a?(Integer)
    end
    count.times do
      task = FactoryGirl.create(
          :task,
          user: User.all.sample,
          attachment: File.open("spec/fixtures/files/#{['text.docx', 'image.jpg'].sample}")
      )
      puts "Задача #{task.name} - создана"
    end
  end
end
