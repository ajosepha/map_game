class GamesController < ApplicationController

  def index
  end

  def create
    @user = User.find(params[:user_id])
    @repeat_flag = false
    @user.games.each do |existing_game|
      if existing_game.game_zip_id == GameZip.where(:zip => params[:game_zip]).first.id
        @repeat_flag = true
        @game = existing_game
      end
    end
    unless @repeat_flag
      @game = Game.new(:user_id => params[:user_id], :game_zip_id => GameZip.where(:zip => params[:game_zip]).first.id, :money => 0, :points => 0)
      @game.save
      @game.game_zip.populate_tables
      @game.game_zip.find_features
      @game.find_status
    end
      redirect_to(action: 'show', id: @game.id, status: 302)
  end

  def new
    @game = Game.new
    @user = User.find(params[:user_id])
  end

  def edit
    @game = Game.find(params[:id])
    @user = User.find(params[:user_id])
  end
  
  def show
    @game = Game.find(params[:id])
    @user = User.find(params[:user_id])
  end

  def update
    @game = Game.find(params[:id])
    @user = User.find(params[:user_id])
    @game.money += params[:game][:money].to_i if params[:value] == "true"

    render 'show'
  end

  def purchase
    @game = Game.find(params[:game_id])
    @user = User.find(params[:user_id])
    if @game.money >= params[:cost].to_i
      @game.money -= params[:cost].to_i
      @game.update_attribute(params[:feature].to_sym, 1)
      @game.save
      render 'win' if @game.win?
    end
    render 'broken'
  end

  def destroy
  end


end