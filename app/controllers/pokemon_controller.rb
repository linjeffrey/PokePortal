class PokemonController < ApplicationController
	def capture
		@pokemon = Pokemon.find(params[:id])
		@pokemon.update(trainer_id: current_trainer.id)
		@pokemon.save
		redirect_to '/'

	end

	def damage
		@pokemon = Pokemon.find(params[:id])
		@pokemon.health -= 10
		@pokemon.save
		redirect_to @pokemon.trainer

	end

	def heal
    	@pokemon = Pokemon.find(params[:id])
    	if @pokemon.health == 100
     		flash[:error] = "Your pokemon is already at full health!"
    	elsif @pokemon.health >= 90
      		@pokemon.health = 100
      		@pokemon.save
   		else
      		@pokemon.health += 10
      		@pokemon.save
    end

    redirect_to current_trainer
  	end

	def new
		@pokemon = Pokemon.new		
	end

	def create
		@pokemon = Pokemon.new(pokemon_params)
		@pokemon.update(level: 1, health: 100, trainer_id: current_trainer.id)
		if @pokemon.save
			redirect_to current_trainer
		else
			redirect_to new_pokemon_path
			flash[:error] = @pokemon.errors.full_messages.to_sentence
		end
	end

	  private
  
  	# filters out unwanted params
  	def pokemon_params
    	params.require(:pokemon).permit(:name)
  	end
end
