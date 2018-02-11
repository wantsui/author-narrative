# Author Narrative

## Purpose
This is my personal project to create a platform for writers to keep track of different aspects of their work privately before making it public. There are probably a few other sites that are already like this, but I'm adding an analytics twist to it (basically, charts).

### Tech Stack
I kept the tech stack simple so I could learn more about different Rails gems. For a full list of helpful resources, check out the last section!
1. PostgreSQL
2. Ruby on Rails
3. Additional Gems:
  - [Devise](https://github.com/plataformatec/devise)
  - [Figaro](https://github.com/laserlemon/figaro)
  - [Chartkick](https://github.com/ankane/chartkick)
  - [Groupdate](https://github.com/ankane/groupdate)
4. [Bootstrap](https://getbootstrap.com/)

### Database Design
I started off with two simple tables.

![Schema][img]
[img]: author-narrative-schema.png

Design:
1. A writer can have many stories.
2. Stories belong to a writer.

Incorporating the Devise gem ended up creating additional fields like encrypted passwords in the writers table.

### Current Features
1. A guest can check out profiles for other writers if they have the link. However, they will only be able to see public stories.
2. A writer can create as many private stories as they want. When the story is meant to be shared, it can! So brainstorm away!
3. I created a seed file with a default user.

### Resources
1. Bootstrap - https://getbootstrap.com/
2. Ruby on Rails - http://guides.rubyonrails.org/
3. Chartkick - https://github.com/ankane/chartkick
4. Devise - https://github.com/plataformatec/devise
5. Figaro - https://github.com/laserlemon/figaro
6. Groupdate - https://github.com/ankane/groupdate
