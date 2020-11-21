require_relative 'pet'
require 'html_pet' 

class Game
  def create_pet
    @pet = Pet.new
    puts 'Ваш виртуальный питомец Панда.'
    print 'Как вы назовете его?'
    @pet.name = gets.chomp.to_s
    puts "#{@pet.name.capitalize} Хорошее имя"
    html
  end

  def start_game
    create_pet
    help
    NewHtml.new.open_in_browser

    while @pet.health != 0
      print "\nВыберите команду (для отображения информации нажмите '5', а затем '«'Enter'): "
      decision = gets.chomp
      break if decision == '6'

      case decision
      when '1'
        @pet.play
        html
      when '2'
        @pet.feed
        html
      when '3'
        @pet.sleep
        html
      when '4'
        @pet.heal
        html
      when '5'
        help
      when ''
        @pet.watch
        html
      else
        puts 'Неправильное действие'
      end
    end
  end

  def help
    puts "\nВыберите действие с #{@pet.name.capitalize}:
      1 - Игра
      2 - Прогулка
      3 - Сон
      4 - Лечение
      6 - Покинуть игру
      Нажмите `Enter` чтобы ничего не делать"
  end

  private

  def html(filename = 'index.html')
    content = "
    <div style='margin-left: 5em; font-size: xx-large'>
      <p>Health: #{@pet.health}</p>
      <p>mood: #{@pet.mood}</p>
      <p>hunger_indicator: #{@pet.hunger_indicator}</p>
      <p>sleep_indicator: #{@pet.sleep_indicator}</p>
    </div>

    <div style='margin-left: 3em; font-size: 3.2em'>
      <p>#{@pet.reaction}</p>
    </div>

    <div style='margin-left: 2em; font-size: 5em'>
      <p>#{@pet.smile}</p>
    </div>"

    NewHtml.new.new_html(content, true, filename)
  end
end

Game.new.start_game
