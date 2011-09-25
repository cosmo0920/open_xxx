# -*- coding: utf-8 -*-
# favotterを開く

Module.new do
  Plugin.create(:open_favotter).add_event_filter(:command){ |menu|
    menu[:open_favotter] = {
      :slug => :open_favotter,
      :name => 'この人のfavotterを開く',
      :condition => lambda{ |m| m.message.repliable? },
      :exec => lambda{ |m| Gtk::openurl("http://favotter.net/user/#{m.message.user.idname}&mode=new") },
      :visible => true,
      :role => :message }
    [menu]
  }
end
