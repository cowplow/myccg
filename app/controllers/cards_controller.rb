class CardsController < ApplicationController
  before_action :set_card, only: [:edit, :update, :show]
  before_action :require_user
  before_action :can_create?, only: [:edit, :udpate]

  def new
    @card = Card.new
  end

  def create
    set_card_type
    set_card_subtypes
    @card = Card.new(card_params)

    if @card.save
      flash[:success] = "New Card created"
      redirect_to new_card_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @card.update(card_params)
      flash[:success] = "Card updated successfully"
      redirect_to show_card_path(@card)
    else
      render :edit
    end
  end

  def show
  end

  def index
    @cards = Cards.all
  end

  private

  def card_params
    params.require(:card).permit!
  end

  def set_card
    @card = Card.find_by(slug: params[:id])
  end

  def require_user
    if !logged_in?
      flash[:warning] = "You must be logged in to perform that action." 
      redirect_to sign_in_path
    end
  end

  def can_create?
    if !current_user.is_super_user?
      flash[:danger] = "Sorry, you have insufficient privlages to perform that action"
      redirect_to root_path
    end
  end

  def set_card_subtypes
    if params[:card][:card_subtypes].size != 1
      card_subtypes = []

      1.upto(params[:card][:card_subtypes].size-1) do |x|
        card_subtypes << CardSubtype.find(params[:card][:card_subtypes][x])
      end

      params[:card][:card_subtypes] = card_subtypes
    end
  end

  def set_card_type
    params[:card][:card_type] = CardType.find(params[:card][:card_type])
  end
end