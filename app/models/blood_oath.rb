class BloodOath

    attr_reader :follower, :cult, :initiation_date

    @@all = []

    def initialize(follower, cult, initiation_date)
        @follower = follower
        @cult = cult
        @initiation_date = initiation_date
        @@all << self 
    end 

    def self.all
        @@all
    end 

    def self.first_follower
        BloodOath.all.sort_by(&:initiation_date).first.follower
    end

end 