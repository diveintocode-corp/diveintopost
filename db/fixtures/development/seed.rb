User.seed(
  :id,
  { id: 1,  email: Faker::Internet.email, password: 'password' },
  { id: 2,  email: Faker::Internet.email, password: 'password' },
  { id: 3,  email: Faker::Internet.email, password: 'password' },
  { id: 4,  email: Faker::Internet.email, password: 'password' },
  { id: 5,  email: Faker::Internet.email, password: 'password' },
  { id: 6,  email: Faker::Internet.email, password: 'password' },
  { id: 7,  email: Faker::Internet.email, password: 'password' },
  { id: 8,  email: Faker::Internet.email, password: 'password' },
  { id: 9,  email: Faker::Internet.email, password: 'password' },
  id: 10, email: Faker::Internet.email, password: 'password'
)

Team.seed(
  :id,
  { id: 1, owner_id: 1, name: 'BasicTeam' },
  { id: 2, owner_id: 2, name: Faker::App.name.delete(' ') },
  id: 3, owner_id: 1, name: Faker::App.name.delete(' ')
)

Assign.seed(
  :id,
  { id: 1, user_id: 3, team_id: 1 },
  { id: 2, user_id: 4, team_id: 1 },
  { id: 3, user_id: 5, team_id: 1 },
  { id: 4, user_id: 6, team_id: 2 },
  { id: 5, user_id: 7, team_id: 2 },
  { id: 6, user_id: 8, team_id: 2 },
  { id: 7, user_id: 1, team_id: 2 },
  { id: 8, user_id: 9, team_id: 3 },
  { id: 9, user_id: 10, team_id: 3 },
  id: 10, user_id: 2, team_id: 3
)

Agenda.seed(
  :id,
  { id: 1, user_id: 1, team_id: 1, title: Faker::Creature::Cat.name, description: Faker::Creature::Cat.registry },
  { id: 2, user_id: 3, team_id: 1, title: Faker::Creature::Cat.name, description: Faker::Creature::Cat.registry },
  { id: 3, user_id: 1, team_id: 1, title: Faker::Creature::Cat.name, description: Faker::Creature::Cat.registry },
  { id: 4, user_id: 2, team_id: 2, title: Faker::Creature::Cat.name, description: Faker::Creature::Cat.registry },
  { id: 5, user_id: 7, team_id: 2, title: Faker::Creature::Cat.name, description: Faker::Creature::Cat.registry },
  { id: 6, user_id: 8, team_id: 2, title: Faker::Creature::Cat.name, description: Faker::Creature::Cat.registry },
  { id: 7, user_id: 10, team_id: 3, title: Faker::Creature::Cat.name, description: Faker::Creature::Cat.registry },
  id: 8, user_id: 2, team_id: 3, title: Faker::Creature::Cat.name, description: Faker::Creature::Cat.registry
)

Article.seed(
  :id,
  { id: 1, user_id: 1, team_id: 1, agenda_id: 1, title: Faker::Book.title, content: Faker::Markdown.random, image: Faker::Avatar.image('my-own-slug') },
  { id: 2, user_id: 3, team_id: 1, agenda_id: 1, title: Faker::Book.title, content: Faker::Markdown.random, image: Faker::Avatar.image('my-own-slug') },
  { id: 3, user_id: 3, team_id: 1, agenda_id: 2, title: Faker::Book.title, content: Faker::Markdown.random, image: Faker::Avatar.image('my-own-slug') },
  { id: 4, user_id: 4, team_id: 1, agenda_id: 2, title: Faker::Book.title, content: Faker::Markdown.random, image: Faker::Avatar.image('my-own-slug') },
  { id: 5, user_id: 1, team_id: 1, agenda_id: 3, title: Faker::Book.title, content: Faker::Markdown.random, image: Faker::Avatar.image('my-own-slug') },
  { id: 6, user_id: 5, team_id: 1, agenda_id: 3, title: Faker::Book.title, content: Faker::Markdown.random, image: Faker::Avatar.image('my-own-slug') },
  { id: 7, user_id: 6, team_id: 2, agenda_id: 4, title: Faker::Book.title, content: Faker::Markdown.random, image: Faker::Avatar.image('my-own-slug') },
  { id: 8, user_id: 7, team_id: 2, agenda_id: 4, title: Faker::Book.title, content: Faker::Markdown.random, image: Faker::Avatar.image('my-own-slug') },
  { id: 9, user_id: 2, team_id: 2, agenda_id: 5, title: Faker::Book.title, content: Faker::Markdown.random, image: Faker::Avatar.image('my-own-slug') },
  { id: 10, user_id: 8, team_id: 2, agenda_id: 5, title: Faker::Book.title, content: Faker::Markdown.random, image: Faker::Avatar.image('my-own-slug') },
  { id: 11, user_id: 1, team_id: 2, agenda_id: 6, title: Faker::Book.title, content: Faker::Markdown.random, image: Faker::Avatar.image('my-own-slug') },
  { id: 12, user_id: 7, team_id: 2, agenda_id: 6, title: Faker::Book.title, content: Faker::Markdown.random, image: Faker::Avatar.image('my-own-slug') },
  { id: 13, user_id: 10, team_id: 3, agenda_id: 7, title: Faker::Book.title, content: Faker::Markdown.random, image: Faker::Avatar.image('my-own-slug') },
  { id: 14, user_id: 2, team_id: 3, agenda_id: 7, title: Faker::Book.title, content: Faker::Markdown.random, image: Faker::Avatar.image('my-own-slug') },
  { id: 15, user_id: 2, team_id: 3, agenda_id: 8, title: Faker::Book.title, content: Faker::Markdown.random, image: Faker::Avatar.image('my-own-slug') },
  id: 16, user_id: 1, team_id: 3, agenda_id: 8, title: Faker::Book.title, content: Faker::Markdown.random, image: Faker::Avatar.image('my-own-slug')
)
