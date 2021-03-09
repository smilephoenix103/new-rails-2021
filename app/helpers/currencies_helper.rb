module CurrenciesHelper
    def get_currencies_with_pattern(country_id, pattern)
        Currency.where(country_id: country_id, pattern: pattern)
    end

    def countries_list
        Country.all.order(country_en: :asc)
    end

end
