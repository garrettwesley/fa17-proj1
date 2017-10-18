class PokemonsController < ApplicationController
    def capture
        @pokemon = Pokemon.find(params[:id])
        @pokemon.trainer = current_trainer
        @pokemon.save   
        redirect_to '/'
    end

    def damage
        @pokemon = Pokemon.find_by(id: params[:id])
        @pokemon.health -= 10
        @pokemon.save

        if @pokemon.health <= 0
          @pokemon.destroy
        end
        redirect_to trainer_path(params[:trainer_id])
    end

    def new
        @pokemon = Pokemon.new
    end

    def create
        @pokemon = Pokemon.new pokemon_params
        @pokemon.level = 1
        @pokemon.health = 100
        @pokemon.trainer_id = current_trainer.id

        if @pokemon.save
            redirect_to trainer_path(id: current_trainer.id)
        else
            redirect_to '/new'
            flash[:error] = @pokemon.errors.full_messages.to_sentence
        end
    end


    private
        def pokemon_params
            params.require(:pokemon).permit(:name)
        end

end
    