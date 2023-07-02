# Create heroes
hero1 = Hero.create(name: 'Kamala Khan', super_name: 'Ms. Marvel')
hero2 = Hero.create(name: 'Doreen Green', super_name: 'Squirrel Girl')
hero3 = Hero.create(name: 'Gwen Stacy', super_name: 'Spider-Gwen')

# Create powers
power1 = Power.create(name: 'Super Strength', description: 'Gives the wielder super-human strengths')
power2 = Power.create(name: 'Flight', description: 'Gives the wielder the ability to fly through the skies at supersonic speed')

# Assign powers to heroes
HeroPower.create(hero: hero1, power: power1, strength: 'Strong')
HeroPower.create(hero: hero1, power: power2, strength: 'Average')