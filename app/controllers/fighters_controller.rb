class FightersController < ApplicationController
  before_action :current_user_must_be_fighter_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_fighter_user
    fighter = Fighter.find(params[:id])

    unless current_user == fighter.profile_creator
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = Fighter.ransack(params[:q])
    @fighters = @q.result(:distinct => true).includes(:profile_creator, :fights, :bsides).page(params[:page]).per(10)

    render("fighters/index.html.erb")
  end

  def show
    @fight = Fight.new
    @fighter = Fighter.find(params[:id])

    render("fighters/show.html.erb")
  end

  def new
    @fighter = Fighter.new

    render("fighters/new.html.erb")
  end

  def create
    @fighter = Fighter.new

    @fighter.wins = params[:wins]
    @fighter.pic = params[:pic]
    @fighter.first_name = params[:first_name]
    @fighter.last_name = params[:last_name]
    @fighter.created_by = params[:created_by]
    @fighter.updated_by = params[:updated_by]
    @fighter.losses = params[:losses]
    @fighter.draws = params[:draws]
    @fighter.no_contests = params[:no_contests]

    save_status = @fighter.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/fighters/new", "/create_fighter"
        redirect_to("/fighters")
      else
        redirect_back(:fallback_location => "/", :notice => "Fighter created successfully.")
      end
    else
      render("fighters/new.html.erb")
    end
  end

  def edit
    @fighter = Fighter.find(params[:id])

    render("fighters/edit.html.erb")
  end

  def update
    @fighter = Fighter.find(params[:id])

    @fighter.wins = params[:wins]
    @fighter.pic = params[:pic]
    @fighter.first_name = params[:first_name]
    @fighter.last_name = params[:last_name]
    @fighter.created_by = params[:created_by]
    @fighter.updated_by = params[:updated_by]
    @fighter.losses = params[:losses]
    @fighter.draws = params[:draws]
    @fighter.no_contests = params[:no_contests]

    save_status = @fighter.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/fighters/#{@fighter.id}/edit", "/update_fighter"
        redirect_to("/fighters/#{@fighter.id}", :notice => "Fighter updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Fighter updated successfully.")
      end
    else
      render("fighters/edit.html.erb")
    end
  end

  def destroy
    @fighter = Fighter.find(params[:id])

    @fighter.destroy

    if URI(request.referer).path == "/fighters/#{@fighter.id}"
      redirect_to("/", :notice => "Fighter deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Fighter deleted.")
    end
  end
end
