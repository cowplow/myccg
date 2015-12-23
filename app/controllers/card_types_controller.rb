class CardTypesController < ApplicationController
  before_action :set_card_type, only: [:edit, :update]
  before_action :require_user
  before_action :can_create?, only: [:edit, :udpate]

  def new
    @card_type = CardType.new
  end

  def create
    @card_type = CardType.new(card_type_params)

    if @card_type.save
      flash[:success] = "Card Type created successfully"
      redirect_to new_card_type_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @card_type.update(card_type_params)
      flash[:success] = "Card Type updated successfully"
      redirect_to edit_card_type_path(@card_type)
    else
      render :edit
    end
  end

  private

  def card_type_params
    params.require(:card_type).permit!
  end

  def set_card_type
    @card_type = CardType.find_by(id: params[:id])
  end

  def can_create?
    if !current_user.is_admin?
      flash[:danger] = "Sorry you cannot perform that action"
      redirect_to card_type_path(@card_type)
    end
  end
end