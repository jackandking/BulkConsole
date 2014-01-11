# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

tool=Tool.create({name: 'Test', cmd: 'date > c:\tmp\#{p1}', p1: 's1', p1_desc: 'filename', o1: 'of1', o1_desc: 'logfile'})
