# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_01_05_145443) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "btree_gin"
  enable_extension "btree_gist"
  enable_extension "citext"
  enable_extension "cube"
  enable_extension "dblink"
  enable_extension "dict_int"
  enable_extension "dict_xsyn"
  enable_extension "earthdistance"
  enable_extension "fuzzystrmatch"
  enable_extension "hstore"
  enable_extension "intarray"
  enable_extension "ltree"
  enable_extension "pg_stat_statements"
  enable_extension "pg_trgm"
  enable_extension "pgcrypto"
  enable_extension "pgrowlocks"
  enable_extension "pgstattuple"
  enable_extension "plpgsql"
  enable_extension "tablefunc"
  enable_extension "unaccent"
  enable_extension "uuid-ossp"
  enable_extension "xml2"

  create_table "code_param", id: { type: :bigint, default: -> { "nextval('code_sequence'::regclass)" }, comment: "Klucz główny" }, comment: "Ustawiena Strony", force: :cascade do |t|
    t.string "web_name", limit: 100, null: false, comment: "Nazwa strony"
    t.string "parameters", limit: 500, comment: "parametry wyswietlaia walut"
    t.datetime "data_add", null: false, comment: "Data dodania"
    t.datetime "data_mod", null: false, comment: "Data modyfikacji"
    t.string "description", limit: 512, comment: "Opis parametru w tabeli"
  end

  create_table "coins", id: { type: :bigint, default: -> { "nextval('coins_sequence'::regclass)" }, comment: "Klucz główny" }, comment: "Tabela zawiera opis monety", force: :cascade do |t|
    t.bigint "currency_id", null: false, comment: "Klucz obcy zawera id waluty"
    t.decimal "denomination", precision: 20, scale: 2, null: false, comment: "Nominał monety"
    t.string "name_currency", limit: 50, null: false, comment: "Nazwa waluty"
    t.decimal "diameter", precision: 6, scale: 2, null: false, comment: "Średnica monety w mm"
    t.decimal "thickness", precision: 6, scale: 2, null: false, comment: "Grubość monety w mm"
    t.integer "signature_code", default: 0, null: false, comment: "Kod orkeslający czy moneta jest(obiegowa, wymienna, nie wymienna, inne)"
    t.decimal "price_buy", precision: 6, scale: 2, default: "0.0", null: false, comment: "Cena zakupu"
    t.decimal "price_sell", precision: 6, scale: 2, default: "0.0", null: false, comment: "Cena sprzedaży(oriętacyjna)"
    t.integer "quantity", default: 0, null: false, comment: "Ilość sztuk"
    t.string "status", limit: 100, null: false, comment: "Kolekcja, na sprzedaż, sprzedane..."
    t.string "status_sell", limit: 100, comment: "Gdzie moneta została wystawiona na sprzedaż"
    t.string "description", limit: 1000, null: false, comment: "Opis"
    t.string "img_type", limit: 50, null: false, comment: "Typ obrazka(skan, foto, www...)"
    t.string "avers_path", limit: 512, null: false, comment: "avers monety"
    t.string "reverse_path", limit: 512, null: false, comment: "revers monety"
    t.date "date_buy_note", comment: "Data zakupu monety"
    t.string "bought", limit: 100, comment: "gdzie kupione"
    t.string "coin_date", limit: 20, null: false, comment: "Data wybicia monety"
    t.string "quality", limit: 200, null: false, comment: "Stan monety"
    t.string "series", limit: 100, comment: "Lata bicia monety"
    t.string "composition", limit: 512, null: false, comment: "skład monety"
    t.datetime "data_add", null: false, comment: "data dodania monety do tabeli"
    t.datetime "data_mod", null: false, comment: "Data modyfikacj danych w tabeli"
  end

  create_table "countries", force: :cascade do |t|
    t.string "continent"
    t.string "country_en"
    t.string "country_pl"
    t.string "capital_city"
    t.string "alfa_2"
    t.string "alfa_3"
    t.string "numeric_code"
    t.string "iso_code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "country", id: { type: :bigint, default: -> { "nextval('country_sequence'::regclass)" }, comment: "Klucz główny" }, comment: "Państwa swiata", force: :cascade do |t|
    t.string "continent", limit: 100, null: false, comment: "Kontynent na kórym lezy państwo"
    t.string "country_en", limit: 100, null: false, comment: "Nazwa państwa po angielsku"
    t.string "country_pl", limit: 100, null: false, comment: "Nazwa państwa po polsku"
    t.string "capital_city", limit: 100, null: false, comment: "Stolica państwa"
    t.string "alfa_2", limit: 5, comment: "część standardu ISO 3166-1, zawiera dwuliterowe kody państw oraz terytoriów"
    t.string "alfa_3", limit: 5, comment: "część standardu ISO 3166-1, zawiera trzyliterowe kody państw, które są wizualnie łatwiejsze w rozpoznawaniu krajów"
    t.string "numeric_code", limit: 5, comment: "trzycyfrowe kody państw"
    t.string "iso_code", limit: 20, comment: " kodowanie nazw państw, terytoriów zależnych oraz jednostek ich podziałów administracyjnych"
    t.datetime "created_at", null: false, comment: "Data dodania"
    t.datetime "updated_at", null: false, comment: "Data modyfikacji"
  end

  create_table "currency", id: { type: :bigint, default: -> { "nextval('currency_sequence'::regclass)" }, comment: "Klucz główny" }, comment: "Spis waluty dla danego państwa swiata", force: :cascade do |t|
    t.bigint "country_id", null: false, comment: "Klucz obcy"
    t.string "cod", limit: 10, null: false, comment: "Kod waluty"
    t.string "currency", limit: 100, null: false, comment: "Nazwa waluty"
    t.string "change", limit: 100, null: false, comment: "Nazwa drobnych"
    t.integer "active", null: false, comment: "Kod okreslający czy dana waluta jest aktualna/wymienna/niewymienna"
    t.string "data_exchange", limit: 100, null: false, comment: "Data wymiany/zmiany/denominacji waluty"
    t.string "currency_from", limit: 100, comment: "Z jakiej waluty na jaka"
    t.string "converter", limit: 100, comment: "przelicznik wymiany/zmiany/denominacji waluty"
    t.string "description", limit: 1000, comment: "Dodatkowe informacje"
    t.datetime "data_add", null: false, comment: "Data dodania"
    t.datetime "data_mod", null: false, comment: "Data modyfikacji"
    t.string "pattern", limit: 100, comment: "Reprezentacja pieniądza note/coin"
  end

  create_table "customer", id: { type: :bigint, default: -> { "nextval('customer_sequence'::regclass)" }, comment: "Klucz główny" }, comment: "Dane klientów", force: :cascade do |t|
    t.string "unique_id", null: false, comment: "Unikalne id klienta"
    t.boolean "active", null: false, comment: "Klient dostepny/niedostępny"
    t.string "name", comment: "Imię klienta"
    t.string "lastname", comment: "Nazwisko klienta"
    t.string "city", comment: "Miejscowość klienta"
    t.string "zip_code", comment: "Kod pocztowy klienta"
    t.string "street", comment: "ulica"
    t.string "number", comment: "Numer mieszkania/lokalu"
    t.string "email", comment: "Email klienta"
    t.string "nick", comment: "Nick klienta"
    t.string "phone", comment: "Numer telefonu klienta"
    t.string "descryption", limit: 1024, comment: "Notatka dotycząca klienta"
    t.datetime "data_add", null: false, comment: "Data dodania"
    t.datetime "data_mod", null: false, comment: "Data modyfikacji"
  end

  create_table "gold_rate", id: { type: :bigint, default: -> { "nextval('gold_sequence'::regclass)" }, comment: "Klucz główny" }, comment: "Zawiera kurs złota", force: :cascade do |t|
    t.date "data_rate", null: false, comment: "Data kursu złota"
    t.decimal "price_for_gram", precision: 10, scale: 4, null: false, comment: "Cena zlota za gram w zł"
    t.decimal "price_for_ounce", precision: 10, scale: 4, null: false, comment: "Cena złota za uncje w zł"
    t.decimal "price_for_ounce_on_usd", precision: 10, scale: 4, comment: "Cena za uncje w dolarach"
    t.decimal "change", precision: 10, scale: 8, comment: "Zmiana kursu złota w procętach"
    t.datetime "data_add", null: false, comment: "Data dodania"
    t.datetime "data_mod", null: false, comment: "Data modyfikacji"
  end

  create_table "notes", id: { type: :bigint, default: -> { "nextval('notes_sequence'::regclass)" }, comment: "Klucz główny" }, comment: "Tabela za banknotami", force: :cascade do |t|
    t.bigint "currency_id", null: false, comment: "Klucz obcy tabela z walutami"
    t.decimal "denomination", precision: 20, scale: 2, null: false, comment: "Nominał banknotu"
    t.string "name_currency", limit: 50, null: false, comment: "Nazwa banknotu"
    t.string "note_date", limit: 20, null: false, comment: "Data druku banknotu"
    t.integer "signature_code", default: 0, null: false, comment: "Kod okreslajacy czy bankot jest Obiegowy/wymienny/nieobieggowy.."
    t.decimal "price_buy", precision: 6, scale: 2, default: "0.0", null: false, comment: "Cena zakupy banknotu"
    t.decimal "price_sell", precision: 6, scale: 2, default: "0.0", null: false, comment: "Cena sprzedaży (możliwość negocjacji)"
    t.integer "quantity", default: 0, null: false, comment: "Ilość sztuk"
    t.string "quality", limit: 200, null: false, comment: "Stan banknotu"
    t.string "status", limit: 100, null: false, comment: "\"K\" - kolekcja, \"S\" - na sprzedaż"
    t.string "description", limit: 1000, null: false, comment: "Opis"
    t.string "img_type", limit: 50, null: false, comment: "Rodzaj obrazka -skan/zdjęcie..."
    t.string "avers_path", limit: 512, null: false, comment: "Ścieżka do zdjęcia banknotu - avers"
    t.string "reverse_path", limit: 512, null: false, comment: "Ścieżka da zdjęcia banknotu - revers"
    t.datetime "data_add", null: false, comment: "Data dodania"
    t.datetime "data_mod", null: false, comment: "Data modyfikacji"
    t.string "series", limit: 100, comment: "Seria banknotu"
    t.string "making", limit: 100, comment: "Materiał z jakiego został zrobiony banknot"
    t.date "date_buy_note", comment: "Data zakupu banknotu"
    t.string "bought", limit: 100, comment: "Gdzie banknot został kupiony"
    t.string "status_sell", limit: 100, comment: "Czy banknot został wystawiony na sprzedaż"
  end

  create_table "order_item", id: { type: :bigint, default: -> { "nextval('order_item_sequence'::regclass)" }, comment: "Klucz główny" }, comment: "Dane banknotu z zamówienia", force: :cascade do |t|
    t.bigint "order_id", null: false, comment: "Klucz obcy"
    t.bigint "note_id", null: false
    t.string "country_en", limit: 100, null: false, comment: "Nazwa państwa po angielsku"
    t.string "cod", limit: 10, comment: "Kod waluty jeżeli istnieje"
    t.decimal "denomination", precision: 20, scale: 2, null: false, comment: "Nominał banknotu"
    t.string "currency_name", limit: 50, null: false, comment: "Nazwa waluty"
    t.string "note_date", limit: 20, null: false, comment: "Data druku banknotu"
    t.decimal "price_buy", precision: 6, scale: 2, default: "0.0", null: false, comment: "Cena zakupu"
    t.decimal "price_sell", precision: 6, scale: 2, default: "0.0", null: false, comment: "Cena wystawionego banknotu"
    t.decimal "price_sell_final", precision: 6, scale: 2, default: "0.0", null: false, comment: "Cena za ile banknot został sprzedany"
    t.integer "quantity", default: 0, null: false, comment: "Iloś banknotów sprzdanych"
    t.string "quality", limit: 200, null: false, comment: "Jakość sprzedawanego banknotu"
    t.string "making", limit: 100, null: false, comment: "Z czego jest wykonany banknot"
    t.string "description", limit: 1000, null: false, comment: "Dodatkowe notatki do banknotu"
    t.string "avers_path", limit: 100, null: false, comment: "Avers Banknotu"
    t.string "reverse_path", limit: 100, null: false, comment: "Revers Banknotu"
    t.datetime "data_add", null: false
    t.datetime "data_mod", null: false
  end

  create_table "orders", id: { type: :bigint, default: -> { "nextval('order_sequence'::regclass)" }, comment: "Klucz główny" }, comment: "Tabela przechowująca zamówienia", force: :cascade do |t|
    t.bigint "customer_id", null: false, comment: "Klucz obcy z tabeli Klient"
    t.string "order_number", limit: 100, null: false
    t.date "date_order", null: false, comment: "Data przyjęcia zamówienia"
    t.boolean "active", null: false, comment: "Czy dane zamówienie jest zakończone"
    t.date "date_send", comment: "Data Wysyłki, odbioru zamówienia"
    t.string "tracking_number", limit: 50, comment: "Numer wysłanej przesyłki"
    t.string "shipment_type", comment: "Rodzaj wysyłki, odbioru"
    t.decimal "shipping_costs", precision: 6, scale: 2, default: "0.0", comment: "Koszty wywyłki"
    t.datetime "data_add", null: false, comment: "Data dodania"
    t.datetime "data_mod", null: false, comment: "Data modyfikacji"
    t.decimal "cash", precision: 6, scale: 2, comment: "Dodatkowe informacje na temat zamówienia"
    t.string "description", limit: 1024
  end

  create_table "signature_code", id: { type: :bigint, default: -> { "nextval('signature_code_sequence'::regclass)" }, comment: "Klucz główny" }, comment: "Sygnature kodów", force: :cascade do |t|
    t.string "new_cod", limit: 100, comment: "Nazwa państwa po angielsku"
    t.string "old_cod", limit: 100, comment: "Nazwa państwa po polsku"
    t.string "description", limit: 500, comment: "Kontynent na kórym lezy państwo"
    t.datetime "data_add", null: false
    t.datetime "data_mod", null: false
  end

  add_foreign_key "coins", "currency", name: "coins_currency_id_fkey"
  add_foreign_key "currency", "country", name: "currency_country_id_fkey"
  add_foreign_key "notes", "currency", name: "notes_currency_id_fkey"
  add_foreign_key "order_item", "orders", name: "order_item_order_id_fkey"
  add_foreign_key "orders", "customer", name: "orders_customer_id_fkey"
end
