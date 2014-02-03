class GamesController < ApplicationController

  def new
    @game = Game.new
    @user = User.find(params[:user_id])
  end
  
  def show
    @game = Game.find(params[:id]) 
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
      @game = Game.new(:user_id => params[:user_id], :game_zip_id => GameZip.where(:zip => params[:game_zip]).first.id)
      @game.save
    end
      redirect_to(action: 'show', id: @game.id, status: 302)
  end

  def edit
    @game = Game.find(params[:id])
    @user = User.find(params[:user_id])
  end

  def update
  end


end