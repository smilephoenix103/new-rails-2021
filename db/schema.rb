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

ActiveRecord::Schema.define(version: 2022_04_01_171553) do

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

  create_table "bonds", force: :cascade do |t|
    t.bigint "currency_id", null: false
    t.date "date_buy"
    t.string "series"
    t.string "bought"
    t.float "denomination"
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
    t.boolean "visible"
    t.string "unit_quantity"
    t.string "unit_currency"
    t.integer "width"
    t.integer "height"
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
    t.text "description"
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
    t.string "unit_quantity"
    t.string "unit_currency"
    t.boolean "visible"
    t.index ["currency_id"], name: "index_coins_on_currency_id"
  end

  create_table "continents", force: :cascade do |t|
    t.string "name_pl"
    t.string "name_en"
    t.string "file_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "countries", id: { comment: "Klucz główny" }, comment: "Państwa swiata", force: :cascade do |t|
    t.string "continent", comment: "Kontynent na kórym lezy państwo"
    t.string "country_en", comment: "Nazwa państwa po angielsku"
    t.string "country_pl", comment: "Nazwa państwa po polsku"
    t.string "capital_city", comment: "Stolica państwa"
    t.string "alfa_2", comment: "część standardu ISO 3166-1, zawiera dwuliterowe kody państw oraz terytoriów"
    t.string "alfa_3", comment: "część standardu ISO 3166-1, zawiera trzyliterowe kody państw, które są wizualnie łatwiejsze w rozpoznawaniu krajów"
    t.string "numeric_code", comment: "trzycyfrowe kody państw"
    t.string "iso_code", comment: " kodowanie nazw państw, terytoriów zależnych oraz jednostek ich podziałów administracyjnych"
    t.datetime "created_at", precision: 6, null: false, comment: "Data dodania"
    t.datetime "updated_at", precision: 6, null: false, comment: "Data modyfikacji"
    t.boolean "exists"
    t.text "description"
  end

  create_table "currencies", id: { comment: "Klucz główny" }, comment: "Spis waluty dla danego państwa swiata", force: :cascade do |t|
    t.bigint "country_id", null: false, comment: "Klucz obcy"
    t.string "cod", comment: "Kod waluty"
    t.string "currency", comment: "Nazwa waluty"
    t.string "change", comment: "Nazwa drobnych"
    t.integer "active", comment: "Kod okreslający czy dana waluta jest aktualna/wymienna/niewymienna"
    t.string "data_exchange", comment: "Data wymiany/zmiany/denominacji waluty"
    t.string "currency_from", comment: "Z jakiej waluty na jaka"
    t.string "converter", comment: "przelicznik wymiany/zmiany/denominacji waluty"
    t.text "description", comment: "Dodatkowe informacje"
    t.datetime "created_at", precision: 6, null: false, comment: "Data dodania"
    t.datetime "updated_at", precision: 6, null: false, comment: "Data modyfikacji"
    t.string "pattern", comment: "Rodzaj elementu"
    t.string "currency_series"
    t.index ["country_id"], name: "index_currencies_on_country_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "lastname"
    t.boolean "active"
    t.string "city"
    t.string "zip_code"
    t.string "street"
    t.string "number"
    t.string "email"
    t.string "nick"
    t.string "phone"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "uuid"
  end

  create_table "notes", id: { comment: "Klucz główny" }, comment: "Tabela za banknotami", force: :cascade do |t|
    t.bigint "currency_id", null: false, comment: "Klucz obcy tabela z walutami"
    t.float "denomination", comment: "Nominał banknotu"
    t.string "name_currency", comment: "Nazwa banknotu"
    t.string "note_date", comment: "Data druku banknotu"
    t.integer "signature_code", comment: "Kod okreslajacy czy bankot jest Obiegowy/wymienny/nieobieggowy.."
    t.float "price_buy", comment: "Cena zakupy banknotu"
    t.float "price_sell", comment: "Cena sprzedaży (możliwość negocjacji)"
    t.integer "quantity", comment: "Ilość sztuk"
    t.string "quality", comment: "Stan banknotu"
    t.string "status", comment: "\"K\" - kolekcja, \"S\" - na sprzedaż"
    t.text "description", comment: "Opis"
    t.string "img_type", comment: "Rodzaj obrazka -skan/zdjęcie..."
    t.text "avers_path", comment: "Ścieżka do zdjęcia banknotu - avers"
    t.text "reverse_path", comment: "Ścieżka da zdjęcia banknotu - revers"
    t.datetime "created_at", precision: 6, null: false, comment: "Data dodania"
    t.datetime "updated_at", precision: 6, null: false, comment: "Data modyfikacji"
    t.string "series", comment: "Seria banknotu"
    t.string "making", comment: "Materiał z jakiego został zrobiony banknot"
    t.date "date_buy_note", comment: "Data zakupu banknotu"
    t.string "bought", comment: "Gdzie banknot został kupiony"
    t.string "status_sell", comment: "Czy banknot został wystawiony na sprzedaż"
    t.integer "note_width"
    t.integer "note_height"
    t.string "unit_quantity"
    t.string "unit_currency"
    t.boolean "visible"
    t.index ["currency_id"], name: "index_notes_on_currency_id"
  end

  create_table "order_items", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.string "pattern"
    t.integer "quantity"
    t.string "unit_quantity"
    t.float "final_price"
    t.text "description"
    t.bigint "note_id"
    t.bigint "coin_id"
    t.bigint "bond_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bond_id"], name: "index_order_items_on_bond_id"
    t.index ["coin_id"], name: "index_order_items_on_coin_id"
    t.index ["note_id"], name: "index_order_items_on_note_id"
    t.index ["order_id"], name: "index_order_items_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.string "order_number"
    t.date "order_date"
    t.date "order_date_send"
    t.string "order_status"
    t.string "tracking_number"
    t.string "shipment_type"
    t.float "shipment_cost"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_orders_on_customer_id"
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

  create_table "settings", force: :cascade do |t|
    t.string "web"
    t.string "name"
    t.string "value"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "signatures", force: :cascade do |t|
    t.integer "signature_cod"
    t.string "short_name"
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
  add_foreign_key "currencies", "countries"
  add_foreign_key "currencies", "countries", name: "currencies_country_id_fkey"
  add_foreign_key "notes", "currencies"
  add_foreign_key "notes", "currencies", name: "notes_currency_id_fkey"
  add_foreign_key "order_items", "bonds"
  add_foreign_key "order_items", "coins"
  add_foreign_key "order_items", "notes"
  add_foreign_key "order_items", "orders"
  add_foreign_key "orders", "customers"
end
