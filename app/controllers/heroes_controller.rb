class HeroesController < ApplicationController
    def index
      heroes = Hero.all
      render json: heroes.map { |hero| { id: hero.id, name: hero.name, super_name: hero.super_name } }
    end
    def show
      hero = Hero.find_by(id: params[:id])
      if hero
        render json: {
          id: hero.id,
          name: hero.name,
          super_name: hero.super_name,
          powers: hero.powers.as_json(only: [:id, :name, :description])
        }
      else
        render json: { error: 'Hero not found' }, status: :not_found
      end
    end
  
  end