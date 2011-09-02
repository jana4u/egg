class Account::DiaryDaysController < ApplicationController
  before_filter :read_character

  # GET /account/diary_days
  def index
    @diary_days = @character.diary_days.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /account/diary_days/1
  def show
    @diary_day = @character.diary_days.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /account/diary_days/new
  def new
    @diary_day = @character.diary_days.build

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /account/diary_days/1/edit
  def edit
    @diary_day = @character.diary_days.find(params[:id])
  end

  # POST /account/diary_days
  def create
    @diary_day = @character.diary_days.build(params[:diary_day])

    respond_to do |format|
      if @diary_day.save
        format.html { redirect_to(account_character_diary_day_url(@character, @diary_day), :notice => 'Diary day was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /account/diary_days/1
  def update
    @diary_day = @character.diary_days.find(params[:id])

    respond_to do |format|
      if @diary_day.update_attributes(params[:diary_day])
        format.html { redirect_to(account_character_diary_day_url(@character, @diary_day), :notice => 'Diary day was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /account/diary_days/1
  def destroy
    @diary_day = @character.diary_days.find(params[:id])
    @diary_day.destroy

    respond_to do |format|
      format.html { redirect_to(account_character_diary_days_url(@character)) }
    end
  end

  private

  def read_character
    @character = current_user.characters.find(params[:character_id])
  end
end
