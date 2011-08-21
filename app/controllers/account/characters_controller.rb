class Account::CharactersController < ApplicationController
  # GET /account/characters
  def index
    @characters = Character.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /account/characters/1
  def show
    @character = Character.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /account/characters/new
  def new
    @character = Character.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /account/characters/1/edit
  def edit
    @character = Character.find(params[:id])
  end

  # POST /account/characters
  def create
    @character = Character.new(params[:character])

    respond_to do |format|
      if @character.save
        format.html { redirect_to(account_character_url(@character), :notice => 'Character was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /account/characters/1
  def update
    @character = Character.find(params[:id])

    respond_to do |format|
      if @character.update_attributes(params[:character])
        format.html { redirect_to(account_character_url(@character), :notice => 'Character was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /account/characters/1
  def destroy
    @character = Character.find(params[:id])
    @character.destroy

    respond_to do |format|
      format.html { redirect_to(account_characters_url) }
    end
  end
end
