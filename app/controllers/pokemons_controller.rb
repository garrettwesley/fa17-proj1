class PokemonsController < ApplicationController
    def capture
        pokemon = Pokemon.find(params[:id])
        pokemon.trainer_id = current_trainer.id
        pokemon.save   
        redirect_to root_path
    end

    def damage
        pokemon = Pokemon.find(params[:id])
        pokemon.health -= 10

        if pokemon.health <= 0
            pokemon.health = 0
        end
        
        pokemon.save
        redirect_to trainer_path(pokemon.trainer.id)
    end

    def new
        @pokemon = Pokemon.new
      end

    def create
        pokemon = Pokemon.new
        pokemon.update(params.require(:pokemon).permit(:name))

        pokemon.level = 1
        pokemon.health = 100
        pokemon.trainer_id = current_trainer.id

        if pokemon.save
            redirect_to trainer_path(id: current_trainer.id)
        else
            flash[:error] = pokemon.errors.full_messages.to_sentence
            redirect_to new_pokemon_path
            
        end
    end

    def heal
        pokemon = Pokemon.find(params[:id])
        pokemon.health += 10
        pokemon.update(health: pokemon.health)
        redirect_to trainer_path(pokemon.trainer.id)

    end

end
    