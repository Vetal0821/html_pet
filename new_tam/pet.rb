class Panda
  attr_accessor :name, :health, :mood, :hunger_indicator, :sleep_indicator, :smile, :reaction

   def initialize(animal = "Panda", name = "Pandulik", health = 100, mood = 100, hunger_indicator = 100, sleep_indicator = 0, smile = '=)', reaction = '')
    @name = name
    @health = health
    @mood = mood
    @hunger_indicator = hunger_indicator
    @sleep_indicator = sleep_indicator
    @smile = smile
    @reaction = reaction

  end

  def play
    @reaction = 'Смешно'
    @mood.between?(0, 90) ? @mood += rand(5..10) : @mood = 100
    @smile = '=)'
    decrease_stat
    time_passed
  end

  def feed
    @reaction = 'ням ням'
    @hunger_indicator.between?(0, 90) ? @hunger_indicator += rand(5..10) : @hunger_indicator = 100
    @smile = '=)'
    increase_stat
    time_passed
  end

  def sleep
    @reaction = "сон... #{@name} проснулся"
    @hunger_indicator > 10 ? @hunger_indicator -= rand(5..10) : @hunger_indicator = 0
    increase_stat
    time_passed
    @smile = '=)'
  end

  def heal
    @health = 100
    @mood = 100
    @reaction = "#{@name} счастливый"
    time_passed
    @smile = '=)'
  end

  def watch
    time_passed
    @smile = '=)'
  end

  private

  def hungry?
    @hunger_indicator < 30
  end

  def happy?
    @mood > 60
  end

  def healthy?
    @health > 50
  end

  def died?
    @health == 0
  end

  def wants_to_sleep?
    @sleep_indicator < 30
  end

  def angry?
    @hunger_indicator < 30 && @mood < 40
  end

  def wants_to_poop?
    @hunger_indicator >= 90
  end

  def decrease_stat
    @hunger_indicator > 20 ? @hunger_indicator -= rand(10..20) : @hunger_indicator = 0
    @sleep_indicator > 20 ? @sleep_indicator -= rand(10..20) : @sleep_indicator = 0
    @health > 20 ? @health -= rand(10..20) : @health = 0
  end

  def increase_stat
    @sleep_indicator.between?(0, 90) ? @sleep_indicator += rand(5..10) : @sleep_indicator = 100
    @mood.between?(0, 90) ? @mood += rand(5..10) : @mood = 100
    @health.between?(0, 90) ? @health += rand(5..10) : @health = 100
  end

  def time_passed
    @reaction = 'плохо' unless healthy?
    @reaction = 'действие' if wants_to_poop?
    @reaction = 'нужен сон' if wants_to_sleep?
    @reaction = "#{@name.capitalize} =)" if died?
    @smile = '=(' if died?
  end
end
