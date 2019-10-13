# seats_reservation.rb

#### Dependencies
* [Ruby *2.5.1*](https://www.ruby-lang.org/en/)
* [Rails *6.0.0*](https://rubyonrails.org)
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
