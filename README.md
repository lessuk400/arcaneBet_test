# Deploy & Enjoy :+1:
- Install **Docker** :whale:
- Customize `.env` from `.env-example`
- run `docker-compose run webpack yarn install --pure-lockfile` to install all node modules.
- run `docker-compose up --build` to create and run the various images, volumes, containers and a network
- run `docker-compose exec web rails db:setup` to create DB, load schema and seed.
- Visit `localhost:3000` and rejoice :wink: