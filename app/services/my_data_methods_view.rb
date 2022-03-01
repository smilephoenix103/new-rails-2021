class MyDataMethodsView

  def self.Note_date_buy(properties)
   VItemInfo.where.not(note_id: nil).group_by_year('v_item_infos.date_buy_note')
       .group('v_item_infos.status_note').order('v_item_infos.status_note')
       .count.map do |(date, status), count|[[date.strftime('%Y'), status], count]
   end

  end

  def self.Note_data_add_to_database(properties)
    # The `group_by_year` method is provided by the `groupdate` gem.
    Note.group_by_month('notes.created_at').group('notes.status').count.map do |(date, status), count|
      [[date.strftime('%b %Y'), status], count]
    end
  end

  def self.Coin_data_add_to_database(properties)
    # The `group_by_year` method is provided by the `groupdate` gem.
    Coin.group_by_month('coins.created_at').group('coins.status').count.map do |(date, status), count|
      [[date.strftime('%b %Y'), status], count]
    end
  end

  def self.Currency_pattern(properties)
    VItemInfo.where.not(note_id: nil, coin_id: nil, bond_id: nil).group('v_item_infos.pattern').order('v_item_infos.pattern').count
  end

  def self.Currency_series_country(properties)
    VItemInfo.where.not(note_id: nil).where(country_en: 'Poland', pattern: 'NOTE').group('v_item_infos.currency_series', 'v_item_infos.pattern').order('v_item_infos.currency_series', 'v_item_infos.pattern').count
  end

end