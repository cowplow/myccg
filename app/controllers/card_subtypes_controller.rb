class CardSubtypesController < ApplicationController
  before_action :set_card_type, only: [:edit, :update]
  before_action :require_user
  before_action :can_create?, only: [:edit, :update]

  def new
    @card_subtype = CardSubtype.new
  end

  def create
    @card_subtype = CardSubtype.new(card_subtype_params)

    if @card_subtype.save
      flash[:success] = "Card Subtype created successfully"
      redirect_to new_card_subtype_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @card_subtype.update(card_subtype_params)
      flash[:success] = "Card Subtype udpated successfully"
      redirect_to edit_card_subtype_path(@card_subtype)
    else
      render :edit
    end
  end

  private

  def card_subtype_params
    params.require(:card_subtype).permit!
  end

  def set_card_type
    @card_subtype = CardSubtype.find_by(id: params[:id])
  end

  def can_create?
    if !current_user.is_admin?
      flash[:danger] = "Sorry you cannot perform that action"
      redirect_to card_subtype_path(@card_subtype)
    end
  end
end