# app/controllers/games_controller.rb
class GamesController < ApplicationController
    before_action :set_game, only: [:show, :edit, :update, :destroy]
  
    def index
      @games = if user_signed_in?
        current_user.games
      else
        Game.all
      end
    
      if params[:search].present?
        all_games = Game.where('title LIKE ?', "%#{params[:search]}%")
        if all_games.any?
          redirect_to action: 'show_details', search: params[:search]
          return

        end
      end
    end
    
    
    
  
    def show
    end
  
    def new
      @game = Game.new
    end
  
    def create
        @game = current_user.games.build(game_params)
    
        if @game.save
          redirect_to @game, notice: 'Game was successfully created.'
        else
          render :new
        end
      end
  
    def edit
    end
  
    def update
      if @game.update(game_params)
        redirect_to @game, notice: 'Game was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
        @game = Game.find(params[:id])
        @game.destroy
      
        redirect_to games_path, notice: 'Game was successfully destroyed.'
      end

      def show_details
        @games = Game.where(title: params[:search])
      
        if @games.blank?
          flash[:alert] = 'Game not found'
          redirect_to games_path
          return
        end
      end
    private
  
    def set_game
      @game = Game.find(params[:id])
    end

    def game_params
    params.require(:game).permit(:title, :platform, :completed, :review, :rating)
     end
  
     end
  