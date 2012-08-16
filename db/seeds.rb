# encoding: UTF-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
regions = ["Downtown / Centro (Sé, República, Luz, and Liberdade)", 
           "Avenida Paulista (Cerqueira César, Jardim Europa)",
           "USP Campus (Butantã)"]

regions.each do |region|
  Region.create(name: region)
end
