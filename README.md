# Zadanie na zaliczenie przedmiotu 'Bazy NoSQL'

Skrypt `get_data_to_mongodb.rb` potrafi pobrać z adresu [http://bash.org.pl/text](http://bash.org.pl/text) dane serwisu w postaci czystego tekstu, sparsować go i zapisać do bazy danych mongodb `nosql_zaliczenie`
jako dokumenty json w kolekcji `mnostwo_bashow`.
Uruchamianie: `ruby get_data_to_mongodb.rb`

Skrypt `mongo_on_the_couch.rb` przenosi dokumenty z mongodb `nosql_zaliczenie` kolekcji `mnostwo_bashow` do couchdb `nosql_zaliczenie`.
Uruchamianie: `ruby mongo_on_the_couch.rb`

Potrzebne gemy znajdują się w `Gemfile` wystarczy uruchomić `bundle install` byy je zainstalować.

