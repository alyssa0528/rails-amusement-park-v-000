class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    if (self.user.tickets < self.attraction.tickets) && (self.user.height < self.attraction.min_height)
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
    elsif self.user.tickets < self.attraction.tickets
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
    elsif self.user.height < self.attraction.min_height
      "Sorry. You are not tall enough to ride the #{self.attraction.name}."
    elsif self.user.tickets > self.attraction.tickets
      new_user_stats
    end
  end

  def new_user_stats
    new_ticket_count = self.user.tickets - self.attraction.tickets
    new_happiness = self.user.happiness + self.attraction.happiness_rating
    new_nausea = self.user.nausea + self.attraction.nausea_rating
    self.user.update(:tickets => new_ticket_count, :happiness => new_happiness, :nausea => new_nausea)
  end

end
