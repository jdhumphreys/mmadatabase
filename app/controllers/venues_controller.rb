class VenuesController < ApplicationController
  before_action :current_user_must_be_venue_user, :only => [:show, :edit, :update, :destroy]

  def current_user_must_be_venue_user
    venue = Venue.find(params[:id])

    unless current_user == venue.venue_creator
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @venues = Venue.all

    render("venues/index.html.erb")
  end

  def show
    @venue = Venue.find(params[:id])

    render("venues/show.html.erb")
  end

  def new
    @venue = Venue.new

    render("venues/new.html.erb")
  end

  def create
    @venue = Venue.new

    @venue.city = params[:city]
    @venue.state = params[:state]
    @venue.name = params[:name]
    @venue.country = params[:country]
    @venue.capacity = params[:capacity]
    @venue.created_by = params[:created_by]
    @venue.pic = params[:pic]
    @venue.updated_by = params[:updated_by]

    save_status = @venue.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/venues/new", "/create_venue"
        redirect_to("/venues")
      else
        redirect_back(:fallback_location => "/", :notice => "Venue created successfully.")
      end
    else
      render("venues/new.html.erb")
    end
  end

  def edit
    @venue = Venue.find(params[:id])

    render("venues/edit.html.erb")
  end

  def update
    @venue = Venue.find(params[:id])

    @venue.city = params[:city]
    @venue.state = params[:state]
    @venue.name = params[:name]
    @venue.country = params[:country]
    @venue.capacity = params[:capacity]
    @venue.created_by = params[:created_by]
    @venue.pic = params[:pic]
    @venue.updated_by = params[:updated_by]

    save_status = @venue.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/venues/#{@venue.id}/edit", "/update_venue"
        redirect_to("/venues/#{@venue.id}", :notice => "Venue updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Venue updated successfully.")
      end
    else
      render("venues/edit.html.erb")
    end
  end

  def destroy
    @venue = Venue.find(params[:id])

    @venue.destroy

    if URI(request.referer).path == "/venues/#{@venue.id}"
      redirect_to("/", :notice => "Venue deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Venue deleted.")
    end
  end
end
