class HeroPowersController < ApplicationController
    def create
      hero_power = HeroPower.new(hero_power_params)
      if hero_power.save
        hero = Hero.find_by(id: hero_power.hero_id)
        render json: hero_json(hero)
      else
        render json: { errors: hero_power.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    private
  
    def hero_power_params
      params.require(:hero_power).permit(:strength, :power_id, :hero_id)
    end
  
    def hero_json(hero)
      {
        id: hero.id,
        name: hero.name,
        super_name: hero.super_name,
        powers: hero.powers.map { |power| power_json(power) }
      }
    end
  
    def power_json(power)
      {
        id: power.id,
        name: power.name,
        description: power.description
      }
    end
  end