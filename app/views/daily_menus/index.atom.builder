atom_feed do |feed|
  feed.title 'Ryo-Lunch RSS'
  feed.updated @daily_menus.last.created_at

  @daily_menus.each do |menu|
    feed.entry(menu,
      url: daily_menu_url(menu),
      published: menu.created_at,
      updated: menu.updated_at) do |entry|
      
      entry.title "#{l(menu.date, format: :short)}のメニュー"
      entry.content <<"EOS", type: :html
【朝食】<br />
#{menu.breakfast.gsub(/\r\n|\n|\r/, ' / ')}
<br />

【昼食】<br />
#{menu.lunch.gsub(/\r\n|\n|\r/, ' / ')}
<br />

【夕食】<br />
#{menu.dinner.gsub(/\r\n|\n|\r/, ' / ')}

<br />
<a href="#{daily_menu_url(menu)}">#{daily_menu_url(menu)}</a>
EOS
    end
  end
end
