class Cult 
    attr_reader :name, :location, :founding_year, :slogan, :minimum_age

    @@all = []

    def initialize(name, location, founding_year, slogan, minimum_age)
        @name = name 
        @location = location
        @founding_year = founding_year.to_i
        @slogan = slogan
        @minimum_age = minimum_age
        @@all << self 
    end 

    def self.all
        @@all
    end 

    def recruit_follower(follower, initiation_date)
        if follower.age < self.minimum_age 
           return puts "We are sorry #{follower.name}, #{self.name} can only accept followers over #{minimum_age} years old. Please come back when you are older!"
        elsif follower.age >= self.minimum_age
            puts "Welcome to #{self.name}, #{follower.name}"
            BloodOath.new(follower, self, initiation_date)
        end 
    end 

    def cult_population
        BloodOath.all.filter { |oaths| oaths.cult == self}.count
    end 

    def self.find_by_name(name)
        Cult.all.filter { |cult| cult.name == name }
    end 

    def self.find_by_location(location)
        Cult.all.filter { |cult| cult.location == location }
    end 

    def self.find_by_founding_year(year)
        Cult.all.filter { |cult| cult.founding_year == year }
    end

    def blood_oaths
        BloodOath.all.filter {|oath| oath.cult == self}
    end 

    def followers
        blood_oaths.map { |oath| oath.follower }
    end 

    def average_age 
        followers.map { |followers| followers.age }.sum / followers.map { |followers| followers.age }.count
    end 
    
    def my_followers_mottos
        followers.map { |followers| followers.life_motto }.join
    end 

    def self.least_popular
        Cult.all.min { |cult1, cult2| cult1.cult_population <=> cult2.cult_population}
    end 

    def self.most_popular
        Cult.all.max { |cult1, cult2| cult1.cult_population <=> cult2.cult_population}
    end 

    def self.most_popular_location
        self.most_popular.location
    end 
end 

