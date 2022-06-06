require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

a = Follower.new("Adam", 24, "LOL")
b = Follower.new("Betty", 21, "Evil.")
c = Follower.new("Chris", 15, "I want to be in a cult!")
d = Follower.new("dhris", 15, "I want to be in a cult!")
e = Follower.new("ehris", 15, "I want to be in a cult!")
f = Follower.new("fhris", 15, "I want to be in a cult!")
g = Follower.new("ghris", 15, "I want to be in a cult!")
h = Follower.new("hhris", 15, "I want to be in a cult!")
i = Follower.new("ihris", 15, "I want to be in a cult!")
j = Follower.new("jhris", 15, "I want to be in a cult!")
k = Follower.new("khris", 15, "I want to be in a cult!")

cult1 = Cult.new("Skull & Bones", "NHV", "1701", "SECRET", 18)
cult2 = Cult.new("Wolfshead", "NHV", "1765", "Don't be a lamb", 21)
cult3 = Cult.new("boring", "NYC", "2020", "we suck", 5)

a.join_cult(cult1, "2002-02-08")
cult2.recruit_follower(b, "2002-02-09")
cult1.recruit_follower(b, "2022-05-19")
c.join_cult(cult3, "2022-05-19")
d.join_cult(cult3, "2022-05-19")
e.join_cult(cult3, "2022-05-19")
f.join_cult(cult3, "2022-05-19")
g.join_cult(cult3, "2022-05-19")
h.join_cult(cult3, "2022-05-19")
i.join_cult(cult3, "2022-05-19")
k.join_cult(cult3, "2022-05-19")




binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits