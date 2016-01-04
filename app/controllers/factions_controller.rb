class FactionsController < ApplicationController
  before_action :set_faction, only: [:edit, :update, :show]
  before_action :require_user
  before_action :can_create?, only: [:edit, :update]

  def new
    @faction = Faction.new
  end

  def create
    @faction = Faction.new(faction_params)

    if @faction.save
      flash[:success] = "Faction created successfully"
      redirect_to new_faction_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @faction.update(faction_params)
      flash[:success] = "Faction Updated Successfully"
      redirect_to edit_faction_path(@faction)
    else
      render :edit
    end
  end

  def show
  end

  def index
    @factions = Faction.all
  end

  private

  def faction_params
    params.require(:faction).permit!
  end

  def set_faction
    @faction = Faction.find_by(slug: params[:id])
  end

  def can_create?
    if !current_user.is_admin?
      flash[:danger] = "Sorry you cannot perform that action"
      redirect_to root_path
    end
  end
end