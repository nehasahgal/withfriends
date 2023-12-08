class TravelersController < ApplicationController
  def index
    matching_travelers = Traveler.all

    @list_of_travelers = matching_travelers.order({ :created_at => :desc })

    render({ :template => "travelers/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_travelers = Traveler.where({ :id => the_id })

    @the_traveler = matching_travelers.at(0)

    render({ :template => "travelers/show" })
  end

  def create
    the_traveler = Traveler.new
    the_traveler.user_id = params.fetch("query_user_id")
    the_traveler.name = params.fetch("query_name")
    the_traveler.trip_id = params.fetch("query_trip_id")
    the_traveler.arrival_flight_time = params.fetch("query_arrival_flight_time")
    the_traveler.departure_flight_time = params.fetch("query_departure_flight_time")
    the_traveler.comments = params.fetch("query_comments")

    if the_traveler.valid?
      the_traveler.save
      redirect_to("/travelers", { :notice => "Traveler created successfully." })
    else
      redirect_to("/travelers", { :alert => the_traveler.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_traveler = Traveler.where({ :id => the_id }).at(0)

    the_traveler.user_id = params.fetch("query_user_id")
    the_traveler.trip_id = params.fetch("query_trip_id")
    the_traveler.arrival_flight_time = params.fetch("query_arrival_flight_time")
    the_traveler.departure_flight_time = params.fetch("query_departure_flight_time")
    the_traveler.comments = params.fetch("query_comments")

    if the_traveler.valid?
      the_traveler.save
      redirect_to("/travelers/#{the_traveler.id}", { :notice => "Traveler updated successfully."} )
    else
      redirect_to("/travelers/#{the_traveler.id}", { :alert => the_traveler.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_traveler = Traveler.where({ :id => the_id }).at(0)

    the_traveler.destroy

    redirect_to("/travelers", { :notice => "Traveler deleted successfully."} )
  end
end
