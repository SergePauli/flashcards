class CardsController < ApplicationController
  before_action :set_card, only: :show

  # GET /cards
  def index
    @cards = Card.all
  end

  # GET /cards/1
  def show
    respond_to do |format|
      format.js
      format.html
    end
  end

  # GET /cards/new
  def new
    @card = Card.new
    @game_over = @card.blank? && Card.normal.count == 0
  end

  # POST /cards
  def create
    @card = Card.new(card_params)

    if @card.save
      redirect_to cards_path, notice: "Карточка '#{@card.name}' успешно создана."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cards/:id?code=1 - для верного ответа or /cards/:id?code=2 - для ошибки
  def update
    @card = Card.find(params[:id])
    if params[:code] === "1"
      @card.level += 1
    elsif params[:code] === "2"
      @card.level = 1
      @card.attempts += 1
    else
      render :show, status: :bad_request, location: @card
    end
    case @card.level
    when 1
      @card.lock_to = 5.seconds.from_now
    when 2
      @card.lock_to = 25.seconds.from_now
    when 3
      @card.lock_to = 2.minutes.from_now
    when 4
      @card.lock_to = 10.minutes.from_now
    when 5
      @card.lock_to = 1.hours.from_now
    when 6
      @card.lock_to = 5.hours.from_now
    when 7
      @card.lock_to = 1.days.from_now
    when 8
      @card.lock_to = 5.days.from_now
    when 9
      @card.lock_to = 25.days.from_now
    when 10
      @card.lock_to = 4.months.from_now
    when 11
      @card.lock_to = nil
    end
    if @card.save
      redirect_to card_url(1), notice: "Статус предыдущей карточки '#{@card.name}' успешно обновлен: Группа - #{@card.level} Следующий показ после: #{@card.lock_to.strftime("%d.%m.%Y %H:%M:%S")}."
    else
      render :show, status: :unprocessable_entity, location: @card
    end
  end

  private

  # Используем скоупы для получения карточки.
  def set_card
    @card = Card.visible.normal.order(level: :desc).order(attempts: :asc).first
  end

  # Only allow a list of trusted parameters through.
  def card_params
    params.require(:card).permit(:name, :description)
  end
end
