# -*- coding: utf-8 -*-
# favstarを開く

Module.new do
  Plugin.create(:open_favstar_favs_from).add_event_filter(:command){ |menu|
    menu[:open_favstar_favs_from] = {
      :slug => :open_favstar_favs_from,
      :name => 'この人のfavstar:favsfromを見る',
      :condition => lambda{ |m| m.message.repliable? },
      :exec => lambda{ |m| Gtk::openurl("http://favstar.fm/users/#{m.message.user.idname}/favs_from") },
      :visible => true,
      :role => :message }
    [menu]
  }
end
