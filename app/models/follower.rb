class Follower

    attr_reader :name, :age, :life_motto
    
    @@all = []

    def initialize(name, age, life_motto)
        @name = name 
        @age = age
        @life_motto = life_motto
        @@all << self
    end 

    def self.all
        @@all
    end 

    def oaths
        BloodOath.all.filter { |oaths| oaths.follower == self }
    end

    def cults 
        oaths.map { |oaths| oaths.cult }
    end 

    def join_cult(cult, initiation_date)
        if self.age < cult.minimum_age
            return puts "We are sorry #{self.name}, #{cult.name} can only accept followers over #{cult.minimum_age} years old. Please come back when you are older!"
        elsif cult.minimum_age <= self.age
            BloodOath.new(self, cult, initiation_date)
            puts "Welcome to #{cult.name}, #{self.name}"
        end 
    end 

    def self.of_a_certian_age(age)
        array = []
        Follower.all.each do |follower| 
            if follower.age > age 
                array << follower
            end 
        end 
        array
    end 

    def fellow_cult_members 
        Follower.all.filter { |follower| follower.cults.intersection(self.cults) != [] }.uniq - [self]
    end 

    def my_cults_slogans
        return cults.map { |cult| cult.slogan }.each { |item| puts item}
    end 

    def cult_count
        cults.count
    end 

    def Follower.most_active 
        Followers.all.max { |f1, f2| f1.cult_count <=> f2.cult_count }
    end 

    def Follower.top_ten
        array = Follower.all.sort_by {|follower| follower.cult_count}.reverse
        array.first(10)
    end 

    def self.of_a_certian_age(age)
        Follower.all.filter { |f| f.age >= age }
    end
end 

