Event.delete_all
Event.create!(
  title: 'Happy Salsa Dance Party',
  description: %{
    <p>Normally, both your asses would be dead as fucking fried chicken, but
    you happen to pull this shit while I'm in a transitional period so I don't
    wanna kill you, I wanna help you. But I can't give you this case, it don't
    belong to me. Besides, I've already been through too much shit this morning
    over this case to hand it over to your dumb ass.</p>
  },
  date: Time.utc(2018, 9, 1)
)
Event.create!(
  title: 'FlowFX Birthday Bash',
  description: %{
    <p>Well, the way they make shows is, they make one show. That show's called
    a pilot. Then they show that show to the people who make shows, and on the
    strength of that one show they decide if they're going to make more shows.
    Some pilots get picked and become television programs. Some don't, become
    nothing. She starred in one of the ones that became nothing.</p>
  },
  date: Time.utc(2018, 9, 1)
)
Event.create!(
  title: 'New Years Eve Reggae Jam',
  description: %{
    <p>Look, just because I don't be givin' no man a foot massage don't make it
    right for Marsellus to throw Antwone into a glass motherfuckin' house,
    fuckin' up the way the nigger talks. Motherfucker do that shit to me, he
    better paralyze my ass, 'cause I'll kill the motherfucker, know what I'm
    sayin'?</p>
  },
  date: Time.utc(2018, 12, 31)
)

Venue.delete_all
Venue.create!(
  name: 'Kalyman Bar',
  address: 'Av. Guadalupe I. Ramírez 263, Amp San Marcos Nte, 16038 Ciudad de México',
  link_url: 'https://es-la.facebook.com/KALYMAN-BAR-214050825308436/'
)
Venue.create!(
  name: 'Cultural Roots',
  address: 'Calle de Tacuba 64, Centro, 06000 Cuauhtemoc'
)
