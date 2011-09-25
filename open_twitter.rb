# -*- coding: utf-8 -*-
# twitter Webを開く

Module.new do
  Plugin.create(:open_twitter).add_event_filter(:command){ |menu|
    menu[:open_twitter] = {
      :slug => :open_twitter,
      :name => 'この人のtwitterを見る', 
      :show_face => lambda{ |m|
          u = if(m.message[:retweet])
                m.message[:retweet].user
              else
                m.message.user end
          "#{u[:idname]}さんのtwitter Webへ".gsub(/_/, '__') },
      :condition => lambda{ |m| m.message.repliable? },
      :exec => lambda{ |m| Gtk::openurl("http://twitter.com/#!/#{m.message.user.idname}") },
      :visible => true,
      :role => :message }
    [menu]
  }
end
