class PowersController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:update] # Skip CSRF protection for the update action
  
    def update
        power = Power.find_by(id: params[:id])
        if power
          if power.update(power_params)
            render json: power_json(power)
          else
            render json: { errors: power.errors.full_messages }, status: :unprocessable_entity
          end
        else
          render json: { error: 'Power not found' }, status: :not_found
        end
      end
    
      private
    
      def power_params
        params.require(:power).permit(:description)
      end
    
      def power_json(power)
        {
          id: power.id,
          name: power.name,
          description: power.description
        }
      end
  end
  