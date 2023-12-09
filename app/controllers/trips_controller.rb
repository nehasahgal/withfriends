class TripsController < ApplicationController
  def index
    matching_trips = Trip.all

    @list_of_trips = matching_trips.order({ :created_at => :desc })

    render({ :template => "trips/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_trips = Trip.where({ :id => the_id })
    
    if current_user != nil
      @user_id = current_user.id
    else
      @user_id = nil
    end


    @list_of_travelers = Traveler.where({ :trip_id => the_id})

    @the_trip = matching_trips.at(0)

    render({ :template => "trips/show" })
  end

  def create
    the_trip = Trip.new
    the_trip.destination = params.fetch("query_destination")
    the_trip.cities = params.fetch("query_cities")
    the_trip.start_date = params.fetch("query_start_date")
    the_trip.end_date = params.fetch("query_end_date")
    the_trip.details = params.fetch("query_trip_details")

    if the_trip.valid?
      the_trip.save
      redirect_to("/trips", { :notice => "Trip created successfully." })
    else
      redirect_to("/trips", { :alert => the_trip.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    @the_trip = Trip.where({ :id => the_id }).at(0)

    @the_trip.destination = params.fetch("query_destination")
    @the_trip.cities = params.fetch("query_cities")
    @the_trip.start_date = params.fetch("query_start_date")
    @the_trip.end_date = params.fetch("query_end_date")
    @the_trip.details = params.fetch("query_trip_details")
    

    if @the_trip.valid?
      @the_trip.save
      redirect_to("/trips/#{@the_trip.id}", { :notice => "Trip updated successfully."} )
    else
      redirect_to("/trips/#{@the_trip.id}", { :alert => the_trip.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_trip = Trip.where({ :id => the_id }).at(0)

    the_trip.destroy

    redirect_to("/trips", { :notice => "Trip deleted successfully."} )
  end
end
