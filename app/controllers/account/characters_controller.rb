class Account::CharactersController < ApplicationController
  # GET /account/characters
  def index
    @characters = current_user.characters.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /account/characters/1
  def show
    @character = current_user.characters.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /account/characters/new
  def new
    @character = current_user.characters.build

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /account/characters/1/edit
  def edit
    @character = current_user.characters.find(params[:id])
  end

  # POST /account/characters
  def create
    @character = current_user.characters.build(params[:character])

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
    @character = current_user.characters.find(params[:id])

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
    @character = current_user.characters.find(params[:id])
    @character.destroy

    respond_to do |format|
      format.html { redirect_to(account_characters_url) }
    end
  end
end
