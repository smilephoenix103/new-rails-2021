class MyDataMethodsView
  # { 'Bernice' => 191, 'Carlee' => 160, 'Edison' => 60, ... }
  def self.view_test(properties)
    # Currency.joins(:country).group('countries.continent').order('countries.continent').count
    # Country.group('countries.continent').order('countries.continent').count
    # Note.joins(:currency).group('currencies.cod').order('currencies.cod').count
    VItemInfo.where(country_en: 'Poland' ).where.not(note_id: nil).group('v_item_infos.pattern','v_item_infos.status_note').order('v_item_infos.pattern','v_item_infos.status_note').count
    # VItemInfo.where(country_en: 'Poland', pattern: 'NOTE').group('v_item_infos.currency_series').order('v_item_infos.currency_series').count
    # Note.group('notes.status','notes.quality').order('notes.quality').count
    # Currency.joins(:notes).group('notes.status','notes.making').order('notes.making','notes.status').count
    # Currency.joins(:notes).group('notes.making').group('notes.status').count.map do |(making, status), count|[[making, status], count]

    # Currency.joins(:notes).group('notes.created_at').group('notes.status').count.map do |(date, status), count|[[date.strftime('%b %-d, %Y'), status], count]
    # end
    # Currency.joins(:notes).group('notes.status').group('currencies.currency_series').count

  end

  def self.Note_data_add_note_group_status(properties)
    # The `group_by_year` method is provided by the `groupdate` gem.
    Note.group_by_year('notes.created_at').group('notes.status').count.map do |(date, status), count|
      [[date.strftime('%Y'), status], count]
    end
  end

  # [
  #   [["Jul 3, 2016", "Hilton"], 2],
  #   [["Jul 10, 2016", "Hilton"], 2],
  #   ...
  #   [["Jul 3, 2016", "Carlee"], 3],
  #   [["Jul 10, 2016", "Carlee"], 5],
  #   ...
  # ]
  # def self.posts_by_created_at_week_and_author(properties)
  #   # The `group_by_week` method is provided by the `groupdate` gem.
  #   Post.joins(:author).group_by_week('posts.created_at').group('authors.name').count.map do |(date, author_name), count|
  #     [[date.strftime('%b %-d, %Y'), author_name], count]
  #   end
  # end

  # # { 'Bernice' => 191, 'Carlee' => 160, 'Edison' => 60, ... }
  # def self.posts_by_author_with_filters(properties)
  #   ui_filters = properties[:ui_filters]

  #   posts = Post.joins(:author).group('authors.name').order('authors.name')
  #   posts = posts.where(created_at: ReportsKit.parse_date_range(ui_filters[:created_at])) if ui_filters[:created_at].present?
  #   posts = posts.where(is_featured: true) if ui_filters[:is_featured]
  #   posts = posts.where(author_id: ui_filters[:author]) if ui_filters[:author].present?
  #   posts = posts.where('title ILIKE ?', "%#{ui_filters[:title]}%") if ui_filters[:title].present?
  #   posts.count
  # end
end