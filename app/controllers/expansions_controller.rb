class ExpansionsController < ApplicationController
  before_action :set_expansion, only: [:edit, :update, :show]
  before_action :require_user, except: [:show, :index]
  before_action :can_create?, only: [:edit, :udpate]

  def new
    @expansion = Expansion.new
  end

  def create
    @expansion = Expansion.new(expansion_params)

    if @expansion.save
      redirect_to expansion_path(@expansion)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @expansion.update(expansion_params)
      flash[:success] = "Expansion updated successfully"
      redirect_to expansion_path(@expansion)
    else
      render :edit
    end
  end

  def show
  end

  def index
    @expansions = Expansion.all
  end

  private

  def expansion_params
    params.require(:expansion).permit!
  end

  def set_expansion
    @expansion = Expansion.find_by(slug: params[:id])
  end

  def can_create?
    if !current_user.is_admin?
      flash[:danger] = "Sorry you cannot perform that action."
      redirect_to expansion_path(@expansion)
    end
  end

end