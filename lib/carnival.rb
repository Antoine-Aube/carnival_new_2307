class Carnival 
  attr_reader :duration, :rides

  def initialize(duration)
    @duration = duration
    @rides = []
  end

  def add_ride(ride)
    @rides << ride
  end

  def most_popular_ride
    most_popular = @rides.max_by do |ride| 
      ride.rider_log.values.sum 
    end
    most_popular
  end

  def most_profitable_ride
    most_profitable = rides.max_by do |ride|
      ride.total_revenue
    end
    most_profitable
  end
end