# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

hunter_x_hunter = Anime.create(
  title: 'Hunter x Hunter',
  genre: 'Shonen',
  episodes: 148,
  year: 2011
)

hunter_x_hunter.characters.create(name: 'Gon Freecss')
hunter_x_hunter.characters.create(name: 'Killua Zoldyck')
hunter_x_hunter.characters.create(name: 'Kurapika Kurta')
hunter_x_hunter.characters.create(name: 'Leorio Paladiknight')
hunter_x_hunter.characters.create(name: 'Hisoka Morrow')
hunter_x_hunter.characters.create(name: 'Illumi Zoldyck')
hunter_x_hunter.characters.create(name: 'Chrollo Lucilfer')
hunter_x_hunter.characters.create(name: 'Tonpa')
hunter_x_hunter.characters.create(name: 'Bicuit Krueger')
hunter_x_hunter.characters.create(name: 'Meruem')
hunter_x_hunter.characters.create(name: 'Komugi')

free = Anime.create(
  title: 'Free!',
  genre: 'Sports / Slice of Life',
  episodes: 36,
  year: 2014
)

free.characters.create(name: 'Haru')
free.characters.create(name: 'Rin')
free.characters.create(name: 'Makato')
free.characters.create(name: 'Nagisa')
free.characters.create(name: 'Rei')

naruto = Anime.create(
  title: 'Naruto',
  genre: 'Shonen',
  episodes: 400,
  year: 2004
)

naruto.characters.create(name: 'Naruto Uzumaki')
naruto.characters.create(name: 'Sasuke Uchiha')
naruto.characters.create(name: 'Sakura Haruno')
naruto.characters.create(name: 'Kakashi Hatake')
naruto.characters.create(name: 'Gaara')
naruto.characters.create(name: 'Rock Lee')
naruto.characters.create(name: 'Ino')
naruto.characters.create(name: 'Chogi')
naruto.characters.create(name: 'Sheeno')
naruto.characters.create(name: 'Shikamaru')
naruto.characters.create(name: 'Konkuro')
naruto.characters.create(name: 'Temari')
naruto.characters.create(name: 'Orochimaru')
naruto.characters.create(name: 'Kabuto')
naruto.characters.create(name: 'Haku')
