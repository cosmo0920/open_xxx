# -*- coding: utf-8 -*-
# favstarを開く

Module.new do
  Plugin.create(:open_twitter).add_event_filter(:command){ |menu|
    menu[:open_twitter] = {
      :slug => :open_twitter,
      :name => 'この人のtwitterを見る',
      :condition => lambda{ |m| m.message.repliable? },
      :exec => lambda{ |m| Gtk::openurl("http://twitter.com/#!/#{m.message.user.idname}") },
      :visible => true,
      :role => :message }
    [menu]
  }
end
