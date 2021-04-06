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

ActiveRecord::Schema.define(version: 2021_04_06_150114) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bonds", force: :cascade do |t|
    t.bigint "currency_id", null: false
    t.date "date_buy"
    t.string "series"
    t.string "bought"
    t.bigint "denomination"
    t.string "name_currency"
    t.string "bond_date"
    t.integer "signature_code"
    t.float "price_buy"
    t.float "price_sell"
    t.integer "quantity"
    t.string "quality"
    t.string "making"
    t.string "status"
    t.string "status_sell"
    t.text "description"
    t.string "img_type"
    t.text "avers_path"
    t.text "reverse_path"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["currency_id"], name: "index_bonds_on_currency_id"
  end

  create_table "boughts", force: :cascade do |t|
    t.string "name"
    t.string "full_name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "charts", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "coins", force: :cascade do |t|
    t.bigint "currency_id", null: false
    t.date "date_buy"
    t.string "bought"
    t.float "denomination"
    t.string "name_currency"
    t.string "coin_date"
    t.string "series"
    t.float "diameter"
    t.float "thickness"
    t.float "weight"
    t.integer "signature_code"
    t.float "price_buy"
    t.float "price_sell"
    t.integer "quantity"
    t.string "quality"
    t.string "status"
    t.string "status_sell"
    t.string "img_type"
    t.text "composition"
    t.text "description"
    t.string "avers_path"
    t.string "reverse_path"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["currency_id"], name: "index_coins_on_currency_id"
  end

  create_table "continents", force: :cascade do |t|
    t.string "name_pl"
    t.string "name_en"
    t.string "file_name"
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
    t.boolean "exists"
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
    t.string "currency_series"
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

  create_table "patterns", force: :cascade do |t|
    t.string "name_pl"
    t.string "name_en"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reports", force: :cascade do |t|
    t.string "report"
    t.string "string"
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "lastname"
    t.string "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bonds", "currencies"
  add_foreign_key "coins", "currencies"
  add_foreign_key "currencies", "countries", name: "currencies_country_id_fkey"
  add_foreign_key "notes", "currencies", name: "notes_currency_id_fkey"
end
