# -*- coding: utf-8 -*-
# Bing検索するよ
Module.new do
   Plugin.create(:yahoo_jp_search).add_event_filter(:command){ |menu|
    menu[:yahoo_jp_search] = {
      :slug => :yahoo_jp_search,
      :name => "yahoojp search",
      :condition => lambda{ |m| true },
      :exec => lambda{ |opt|
        yahoo_search_word = opt.message.entity.to_s[opt.miraclepainter.textselector_range]
        Gtk::openurl("http://search.yahoo.co.jp/search?p=" + URI.escape(yahoo_search_word).to_s) },
      :visible => true,
      :role => :message_select }
    [menu]
	  }
end
