# -*- coding: utf-8 -*-
# Bing検索するよ
Module.new do
   Plugin.create(:bing_search).add_event_filter(:command){ |menu|
    menu[:bing_search] = {
      :slug => :bing_search,
      :name => "bing search",
      :condition => lambda{ |m| true },
      :exec => lambda{ |opt|
        bing_search_word = opt.message.entity.to_s[opt.miraclepainter.textselector_range]
        Gtk::openurl("http://www.bing.com/search?q=" + URI.escape(bing_search_word).to_s) },
      :visible => true,
      :role => :message }
    [menu]
	  }
end
