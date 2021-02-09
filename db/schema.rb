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

ActiveRecord::Schema.define(version: 2021_02_08_154157) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "charts", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "countries", id: { type: :bigint, default: -> { "nextval('countries_sequence'::regclass)" }, comment: "Klucz główny" }, comment: "Państwa swiata", force: :cascade do |t|
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

  create_table "currencies", id: { type: :bigint, default: -> { "nextval('currencys_sequence'::regclass)" }, comment: "Klucz główny" }, comment: "Spis waluty dla danego państwa swiata", force: :cascade do |t|
    t.bigint "country_id", null: false, comment: "Klucz obcy"
    t.string "cod", limit: 10, null: false, comment: "Kod waluty"
    t.string "currency", limit: 100, null: false, comment: "Nazwa waluty"
    t.string "change", limit: 100, null: false, comment: "Nazwa drobnych"
    t.integer "active", null: false, comment: "Kod okreslający czy dana waluta jest aktualna/wymienna/niewymienna"
    t.string "data_exchange", limit: 100, null: false, comment: "Data wymiany/zmiany/denominacji waluty"
    t.string "currency_from", limit: 100, comment: "Z jakiej waluty na jaka"
    t.string "converter", limit: 100, comment: "przelicznik wymiany/zmiany/denominacji waluty"
    t.string "description", limit: 1000, comment: "Dodatkowe informacje"
    t.datetime "created_at", null: false, comment: "Data dodania"
    t.datetime "updated_at", null: false, comment: "Data modyfikacji"
    t.string "pattern", limit: 100, comment: "Rodzaj elementu"
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
    t.datetime "created_at", null: false, comment: "Data dodania"
    t.datetime "updated_at", null: false, comment: "Data modyfikacji"
    t.string "series", limit: 100, comment: "Seria banknotu"
    t.string "making", limit: 100, comment: "Materiał z jakiego został zrobiony banknot"
    t.date "date_buy_note", comment: "Data zakupu banknotu"
    t.string "bought", limit: 100, comment: "Gdzie banknot został kupiony"
    t.string "status_sell", limit: 100, comment: "Czy banknot został wystawiony na sprzedaż"
  end

  create_table "reports", force: :cascade do |t|
    t.string "report"
    t.string "string"
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "currencies", "countries", name: "currencies_country_id_fkey"
  add_foreign_key "notes", "currencies", name: "notes_currency_id_fkey"
end
