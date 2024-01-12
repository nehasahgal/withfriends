class FriendrequestsController < ApplicationController
  def index
    matching_friendrequests = Friendrequest.all

    @list_of_friendrequests = matching_friendrequests.order({ :created_at => :desc })

    render({ :template => "friendrequests/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_friendrequests = Friendrequest.where({ :id => the_id })

    @the_friendrequest = matching_friendrequests.at(0)

    render({ :template => "friendrequests/show" })
  end

  def create
    the_friendrequest = Friendrequest.new
    the_friendrequest.recipient_id = params.fetch("query_recipient_id")
    the_friendrequest.sender_id = params.fetch("query_sender_id")

    if the_friendrequest.valid?
      the_friendrequest.save
      redirect_to("/friendrequests", { :notice => "Friendrequest created successfully." })
    else
      redirect_to("/friendrequests", { :alert => the_friendrequest.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_friendrequest = Friendrequest.where({ :id => the_id }).at(0)

    the_friendrequest.recipient_id = params.fetch("query_recipient_id")
    the_friendrequest.sender_id = params.fetch("query_sender_id")

    if the_friendrequest.valid?
      the_friendrequest.save
      redirect_to("/friendrequests/#{the_friendrequest.id}", { :notice => "Friendrequest updated successfully."} )
    else
      redirect_to("/friendrequests/#{the_friendrequest.id}", { :alert => the_friendrequest.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_friendrequest = Friendrequest.where({ :id => the_id }).at(0)

    the_friendrequest.destroy

    redirect_to("/friendrequests", { :notice => "Friendrequest deleted successfully."} )
  end
end
