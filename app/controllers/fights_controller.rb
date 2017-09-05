class FightsController < ApplicationController
  def index
    @fights = Fight.page(params[:page]).per(10)

    render("fights/index.html.erb")
  end

  def show
    @fight = Fight.find(params[:id])

    render("fights/show.html.erb")
  end

  def new
    @fight = Fight.new

    render("fights/new.html.erb")
  end

  def create
    @fight = Fight.new

    @fight.fighter = params[:fighter]
    @fight.fighter2 = params[:fighter2]
    @fight.venue = params[:venue]
    @fight.result = params[:result]
    @fight.date = params[:date]
    @fight.tagline = params[:tagline]
    @fight.attendance = params[:attendance]
    @fight.poster = params[:poster]

    save_status = @fight.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/fights/new", "/create_fight"
        redirect_to("/fights")
      else
        redirect_back(:fallback_location => "/", :notice => "Fight created successfully.")
      end
    else
      render("fights/new.html.erb")
    end
  end

  def edit
    @fight = Fight.find(params[:id])

    render("fights/edit.html.erb")
  end

  def update
    @fight = Fight.find(params[:id])

    @fight.fighter = params[:fighter]
    @fight.fighter2 = params[:fighter2]
    @fight.venue = params[:venue]
    @fight.result = params[:result]
    @fight.date = params[:date]
    @fight.tagline = params[:tagline]
    @fight.attendance = params[:attendance]
    @fight.poster = params[:poster]

    save_status = @fight.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/fights/#{@fight.id}/edit", "/update_fight"
        redirect_to("/fights/#{@fight.id}", :notice => "Fight updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Fight updated successfully.")
      end
    else
      render("fights/edit.html.erb")
    end
  end

  def destroy
    @fight = Fight.find(params[:id])

    @fight.destroy

    if URI(request.referer).path == "/fights/#{@fight.id}"
      redirect_to("/", :notice => "Fight deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Fight deleted.")
    end
  end
end
