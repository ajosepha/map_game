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
    @game.money = @game.money + params[:game][:money].to_i
    redirect_to(action: 'show', id: @game.id, status: 302)
  end

  def destroy
  end




  def update
  end


end