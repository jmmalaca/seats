# seats.rb

#### Goal
Build a small example of a seats reservation webpage for some show. The page
should present to the users a map of the show room with 25 * 20 seats. These
seats should be with some colors:
- green, it's free
- grey, it's selected by me
- light red, it's selected by other user
- red, it's reserved

Examples:
- one user selected a seat, all users except him should see that seat light red;
- one user reserves a seat, all users should see that seat red;

All of the actions should occour in "real time", meaning as fast as possible and
without the need of reloading the page.

#### Solution:
- making use of ActiveCable + Redis


#### Dependencies
* [Ruby *2.5.1*](https://www.ruby-lang.org/en/)
* [Rails *6.0.0*](https://rubyonrails.org)
* [Redis *5.0.6*](https://redis.io/)
* [PostgreSQL *11.2*](https://www.postgresql.org)

#### Dependencies manager tool - [RVM](https://rvm.io)
- file: `.ruby-version` ( set the ruby version )
- file: `.ruby-gemset` ( sets the gemset where all dependencies will be stored )

#### Configuration
```bash
$ ./bin/setup
```

#### ENV
Do not forget to insert the right values on the `.env` file.

#### Linting
```bash
$ rubocop # run rubocop
$ rubocop <path to file>.rb # run rubocop for one file
```

#### Server
```bash
$ rails s # default port number - 3000
$ rails s -p <port number> # select the port
```

#### Tests
```bash
$ rspec spec/<path to file>_spec.rb # run a spec
$ rspec # run the test suite
```

#### Redis
```bash
$ redis-cli monitor # redis live console
```
