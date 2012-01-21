# -*- coding: utf-8 -*-
# twilogを開く

Module.new do
  Plugin.create(:open_twilog).add_event_filter(:command){ |menu|
    menu[:open_twilog] = {
      :slug => :open_twilog,
      :name => 'この人のtwilogを見る', 
      :show_face => lambda{ |m|
          u = if(m.message[:retweet])
                m.message[:retweet].user
              else
                m.message.user end
          "#{u[:idname]}さんのtwilogへ".gsub(/_/, '__') },
      :condition => lambda{ |m| m.message.repliable? },
      :exec => lambda{ |m| Gtk::openurl("http://twilog.org/#{m.message.user.idname}") },
      :visible => true,
      :role => :message }
    [menu]
  }
end
