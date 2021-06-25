module CurrenciesHelper
    def get_currencies_with_pattern(country_id, pattern)
        Currency.where(country_id: country_id, pattern: pattern)
    end

    def countries_list
        Country.all.order(country_en: :asc)
    end

    def currency_series(object, pattern)
        currencies = Currency.where(country_id: object.currency.country.id, pattern: pattern).order(currency_series: :asc)
    end
end
