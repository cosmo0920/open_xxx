# -*- coding: utf-8 -*-
# Bing検索するよ
Module.new do
  Plugin.create :bing_search do
    command(:bing_search,
      name: 'bing search',
      condition: Plugin::Command[:HasOneMessage, :TimelineTextSelected],
      visible: true,
      role: :timeline) do |opt|
        Gtk::openurl("http://www.bing.com/search?q=" + URI.escape(opt.widget.selected_text(opt.messages.first)).to_s)
    end
  end
end

